// Draws the card a link to this site unfurls into: 1200×630, the size Open Graph asks for.
//
// **Drawn rather than stored**, following the precedent the product's own icon set in feature 023.
// A picture in a repository is a binary nobody can review; a picture described in fractions of its
// canvas is a diff. Change a number here and the change is visible in a pull request.
//
//     swift tools/make-og.swift assets/img/icon.png assets/img/og.png

import AppKit
import CoreGraphics
import Foundation

let arguments = CommandLine.arguments
guard arguments.count == 3 else {
    FileHandle.standardError.write(Data("usage: make-og.swift <icon.png> <out.png>\n".utf8))
    exit(2)
}

// The canvas, and everything on it in fractions of it.
let width = 1200.0
let height = 630.0
let margin = 96.0
let iconSide = 168.0

// The product's own two colours, from bundle/make-icon.swift in the code repository. Repeated here
// because the two repositories do not share a build — and repeated as a comment saying so, which is
// the cheapest form of the link.
let accentTop = CGColor(red: 0x2E / 255, green: 0x6B / 255, blue: 0xE6 / 255, alpha: 1)
let accentBottom = CGColor(red: 0x0E / 255, green: 0x9A / 255, blue: 0xB8 / 255, alpha: 1)
let ink = NSColor(calibratedWhite: 0.94, alpha: 1)
let inkSoft = NSColor(calibratedWhite: 0.66, alpha: 1)
let paper = CGColor(red: 0x10 / 255, green: 0x12 / 255, blue: 0x16 / 255, alpha: 1)

guard let space = CGColorSpace(name: CGColorSpace.sRGB),
    let context = CGContext(
        data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0,
        space: space, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)
else {
    FileHandle.standardError.write(Data("could not create a context\n".utf8))
    exit(1)
}

// The ground. One colour, dark: the card is shown against both light and dark chat backgrounds,
// and a dark card is the one that keeps its edges in either.
context.setFillColor(paper)
context.fill(CGRect(x: 0, y: 0, width: width, height: height))

// The accent, as a band along the foot rather than a wash behind everything: an accent that covers
// the card is not an accent, it is a background.
if let gradient = CGGradient(
    colorsSpace: space, colors: [accentTop, accentBottom] as CFArray, locations: [0, 1])
{
    context.saveGState()
    context.clip(to: CGRect(x: 0, y: 0, width: width, height: 12))
    context.drawLinearGradient(
        gradient, start: CGPoint(x: 0, y: 0), end: CGPoint(x: width, y: 0), options: [])
    context.restoreGState()
}

let graphics = NSGraphicsContext(cgContext: context, flipped: false)
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = graphics

// The icon, at the top left, where the eye starts.
if let icon = NSImage(contentsOfFile: arguments[1]) {
    icon.draw(
        in: CGRect(x: margin, y: height - margin - iconSide, width: iconSide, height: iconSide))
}

/// Draws one line with its **top** at `top`, and answers where the next line's top should be.
///
/// Measured rather than guessed: placing text by its box in a non-flipped context and hoping is how
/// the first draft came out with the title against the icon and a hole beneath it. The height comes
/// from the string, so changing a size cannot silently ruin the spacing.
@discardableResult
func draw(
    _ text: String, size: CGFloat, weight: NSFont.Weight, colour: NSColor, top: Double,
    then gap: Double = 0
) -> Double {
    let attributes: [NSAttributedString.Key: Any] = [
        .font: NSFont.systemFont(ofSize: size, weight: weight),
        .foregroundColor: colour,
    ]
    let string = NSAttributedString(string: text, attributes: attributes)
    let measured = string.boundingRect(
        with: CGSize(width: width - 2 * margin, height: .greatestFiniteMagnitude),
        options: [.usesLineFragmentOrigin])
    let box = CGRect(
        x: margin, y: top - measured.height, width: width - 2 * margin, height: measured.height)
    string.draw(with: box, options: [.usesLineFragmentOrigin], context: nil)
    return box.minY - gap
}

// The block is stacked from the icon down, each line placed under the one measured above it.
var cursor = height - margin - iconSide - 36

cursor = draw("HostSwitcher", size: 76, weight: .semibold, colour: ink, top: cursor, then: 26)
cursor = draw(
    "Switch /etc/hosts environments from the menu bar.", size: 38, weight: .regular, colour: inkSoft,
    top: cursor, then: 22)
draw(
    "Native macOS · sets of entries · one click · no sudo nano", size: 26, weight: .regular,
    colour: inkSoft.withAlphaComponent(0.75), top: cursor)

NSGraphicsContext.restoreGraphicsState()

guard let image = context.makeImage() else {
    FileHandle.standardError.write(Data("could not make an image\n".utf8))
    exit(1)
}

let bitmap = NSBitmapImageRep(cgImage: image)
guard let png = bitmap.representation(using: .png, properties: [:]) else {
    FileHandle.standardError.write(Data("could not encode a PNG\n".utf8))
    exit(1)
}

try png.write(to: URL(fileURLWithPath: arguments[2]))
print("wrote \(arguments[2]) — \(Int(width))×\(Int(height))")

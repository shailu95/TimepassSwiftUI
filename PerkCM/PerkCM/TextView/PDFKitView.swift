//
//  Copyright © 2019 PSPDFKit GmbH. All rights reserved.
//
//  The PSPDFKit Sample applications are licensed with a modified BSD license.
//  Please see License for details. This notice may not be removed from this file.
//

import SwiftUI
import PDFKit

struct PDFKitView: View {
    var url: URL

    var body: some View {
        PDFKitRepresentedView(url)
    }
}

#if DEBUG
struct PDFKitView_Preview: PreviewProvider {
    static var previews: some View {
        PDFKitRepresentedView(Bundle.main.bundleURL.appendingPathComponent("PSPDFKit 9 QuickStart Guide.pdf"))
    }
}
#endif

struct PDFKitRepresentedView: UIViewRepresentable {
    let url: URL

    init(_ url: URL) {
        self.url = url
    }

    func makeUIView(context: UIViewRepresentableContext<PDFKitRepresentedView>) -> PDFKitRepresentedView.UIViewType {
        // Create a `PDFView` and set its `PDFDocument`.
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: self.url)
        pdfView.autoScales = true
        return pdfView
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {
        // Update the view.
    }
}

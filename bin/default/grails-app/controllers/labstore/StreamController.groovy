package labstore

import labstore.Material
import com.itextpdf.kernel.pdf.*;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;


class StreamController {

    def index() { 

        File file = new File("hello.pdf") 
        PdfDocument pdf = new PdfDocument(new PdfWriter(file));
        Document document = new Document(pdf)
        String line = "Hello Edmilson Filimone! Welcome to iTextPdf"
        String line2 = "Custou mas valeu a pena, aqui esta um pdf em java++, kkkk Groovy :)"
        document.add(new Paragraph(line))
        document.add(new Paragraph(line2))
        document.close()
        //response.contentType  = 'application/pdf'
        response.outputStream << file.getBytes()
        //response.outputStream.flush()
    }

    def MyCsv(){
        def matList = Material.list()
        def data = new ArrayList()
        data.add(Arrays.asList("Material", "Quantidade"))

        matList.each {
            data.add(Arrays.asList(it.name, it.quantity.toString()))
        }
        def file = File.createTempFile('mycsv', '.csv')
        file.text = data*.join(',').join(System.lineSeparator())
        response.contentType  = 'text/csv'
        response.outputStream << file.getBytes()
    }
}

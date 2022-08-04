package labstore

import labstore.Material
import labstore.Entry
import labstore.Outs


class StreamController {

    def material_csv(){
        def matList = Material.list()
        def data = new ArrayList()
        data.add(Arrays.asList("Material", "Quantidade", "Expire Date"))

        matList.each {
            data.add(Arrays.asList(it.name, it.quantity.toString(), it.expireDate))
        }

        def file = File.createTempFile('Material', '.csv')
        file.text = data*.join(',').join(System.lineSeparator())
        response.contentType  = 'text/csv'
        response.outputStream << file.getBytes()
    }

    def entry_csv(){
        def matList = Entry.list()
        def data = new ArrayList()
        data.add(Arrays.asList("Material", "Quantidade", "Entry Date"))

        matList.each {
            data.add(Arrays.asList(it.material.name, it.quantity.toString(), it.date))
        }
        def file = File.createTempFile('Entradas', '.csv')
        file.text = data*.join(',').join(System.lineSeparator())
        response.contentType  = 'text/csv'
        response.outputStream << file.getBytes()
    }

    def outs_csv(){
        def matList = Outs.list()
        def data = new ArrayList()
        data.add(Arrays.asList("Material", "Quantidade","Destiny", "Out Date"))

    matList.each {
            data.add(Arrays.asList(it.material.name, it.quantity.toString(),it.destiny ,it.date.toString()))
        }
    def file = File.createTempFile('Outs', '.csv')
        file.text = data*.join(',').join(System.lineSeparator())
        response.contentType  = 'text/csv'
        response.outputStream << file.getBytes()
    }  
}

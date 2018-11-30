//
//  Repository.swift
//  zsip
//
//  Created by ELIAS PERIAÑEZ AGUILERA on 28/11/18.
//  Copyright © 2018 ELIAS PERIAÑEZ AGUILERA. All rights reserved.
//

import Foundation

class Repository{
    static let shared = Repository()
    
    private var ct: [Category] = []
    private var rp: [Recipe] = []
    
    private func createRecipes(){
        if(rp.count == 0){
        let rc1 =  Recipe()
        rc1.title = "Sopa de apendice inflamado"
        rc1.img = "https://www.laylita.com/recetas/wp-content/uploads/2008/01/quinoa-soup2.JPG"
        rc1.dififculty = "Dificil"
            rc1.ingredients = ["Enfermo de apendicitis", "Agua", "Sal"]
        rc1.steps = ["Conseguir","Disfrutar"]
        rc1.geo = Geo()
        rc1.geo.lat = 68.83501
        rc1.geo.long = 40.02479
            
        let rc2 = Recipe()
        rc2.title = "Estofado de revisor de la renfe"
        rc2.img = "https://www.annarecetasfaciles.com/files/estofado-de-ternera-21.jpg"
        rc2.dififculty = "Media"
        rc2.ingredients = ["Revisor de la renfe", "Patatas", "Pastilla de avecrem"]
        rc2.steps = ["Extraer el apendice", "Cocer a fuego lento por 30 minutos", "Disfrutar"]
        rc2.geo = Geo()
        rc2.geo.lat = 23.12448
        rc2.geo.long = 11.65681
            
        let rc3 = Recipe()
        rc3.title = "Filete de Carcharodon megalodon"
        rc3.img = "https://img.recetascomidas.com/recetas/640_480/filete-de-merluza-a-la-plancha.jpg"
        rc3.dififculty = "Facil"
        rc3.ingredients = ["Carcharodon megalodon"]
            rc3.steps = ["Cazar un megalodon fresco", "Partir en filetes", "Cocinar a la plancha por 5 minutos", "Disfrutar"]
        rc3.geo = Geo()
        rc3.geo.lat = -12.19088
        rc3.geo.long = 140.56602
            
            
        let rc4 = Recipe()
        rc4.title = "Zanahorias con crack"
        rc4.img = "https://images-gmi-pmc.edge-generalmills.com/5c3c5678-9667-4a86-988d-b3299b9de7df.jpg"
        rc4.dififculty = "Media"
        rc4.ingredients = ["Zanahorias", "Crack"]
        rc4.steps = ["Cocer las zanahorias", "Aliñar", "Disfrutar"]
        rc4.geo = Geo()
        rc4.geo.lat = 38.51295
        rc4.geo.long = -117.18046
            
        let rc5 = Recipe()
        rc5.title = "La esencia del rap"
        rc5.img = "https://www.gallinablanca.es/files/thumbs/93ac7ec8d0afe3342fccb9561ae8164338b202f7_r476_261_5.jpg"
        rc5.dififculty = "Dificil"
        rc5.ingredients = ["Un microfono"]
        rc5.steps = ["Dejarte llevar", "Disfrutar"]
        rc5.geo = Geo()
        rc5.geo.lat = -13.69657
        rc5.geo.long = -66.57821
            
        let rc6 = Recipe()
        rc6.title = "Yogur"
        rc6.img = "https://estaticos.miarevista.es/media/cache/1000x590_thumb/uploads/images/gallery/58b033e05cafe84fb78b4567/hacendado_0.jpg"
        rc6.dififculty = "Dificil"
        rc6.ingredients = ["Yogur hacendado"]
        rc6.steps = ["Abrir el yogur","Disfrutar"]
        rc6.geo = Geo()
        rc6.geo.lat = 29.87006
        rc6.geo.long = 81.90160
        rp = [rc1, rc2, rc3, rc4, rc5, rc6]
        }
    }
    
    
    private func createCategories(){
        createRecipes()
        if(ct.count == 0){
            let meat = Category()
            meat.name = "Carnes"
            meat.img = "https://estaticos.muyinteresante.es/media/cache/760x570_thumb/uploads/images/article/5a37f7435cafe848e93c9869/carne-roja_0.jpg"
            meat.arRecipes = [rp[0], rp[1]]
            
            let badStuff = Category()
            badStuff.name = "Verduras"
            badStuff.img = "https://img.elcomercio.pe/files/ec_article_multimedia_gallery/uploads/2018/02/22/5a8f364bb3355.jpeg"
            badStuff.arRecipes = [rp[3], rp[4]]

            
            let seaMeat = Category()
            seaMeat.name = "Pescado"
            seaMeat.img = "https://www.ecestaticos.com/imagestatic/clipping/88b/7f7/88b7f7def45fa205facf0f101f71ca10/el-truco-idoneo-para-conservar-bien-el-pescado-en-la-nevera.jpg?mtime=1493306278"
            seaMeat.arRecipes = [rp[3], rp[4]]
            seaMeat.arRecipes = [rp[2]]

            let juicyStuff = Category()
            juicyStuff.name = "Postres"
            juicyStuff.img = "https://www.cocinavital.mx/wp-content/uploads/2018/02/postre_chocolate_avellana.jpg"
            juicyStuff.arRecipes = [rp[5]]
            
            ct = [meat, badStuff, seaMeat, juicyStuff]
        }
    }
    
    func getCategories()->[Category]{
        createCategories()
        return ct
    }
    
    func getRecipes(category:String)->[Recipe]{
        createCategories()
        var result: [Recipe] = []
        if(category == ""){
            result = rp
        }else{
            for cat in ct {
                if(cat.name == category){
                    result.append(contentsOf: cat.arRecipes)
                }
            }
        }
        return result
    }
}

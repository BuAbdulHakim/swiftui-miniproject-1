//
//  ContentView.swift
//  SwiftUI-MiniProject_1
//
//  Created by NasserAlsaqabi on 31/12/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                Text("مرحباً بك ،، يمكنك اختيار الدراجة المناسبة لك من القائمة وأكمل بيانات للحجز")
                
                NavigationLink(
                    destination: BicycleView(name: "", phone: "", numberOfHours: 0, numberOfBicycles: 0, img: "1"),
                    label: {
                        BicyleRow(txt: "1", img: "1")
                        
                    })
                NavigationLink(
                    destination: BicycleView(name: "", phone: "", numberOfHours: 0, numberOfBicycles: 0, img: "2"),
                    label: {
                        BicyleRow(txt: "2", img: "2")
                        
                    })
                NavigationLink(
                    destination: BicycleView(name: "", phone: "", numberOfHours: 0, numberOfBicycles: 0, img: "3"),
                    label: {
                        BicyleRow(txt: "3", img: "3")
                        
                    })
                NavigationLink(
                    destination: BicycleView(name: "", phone: "", numberOfHours: 0, numberOfBicycles: 0, img: "4"),
                    label: {
                        BicyleRow(txt: "4", img: "4")
                        
                    })
            }.navigationBarTitle("تأجير الدراجات")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct PaymentView: View {
    let name: String
    let numberOfHours: Double
    let phone: String
    let totalPrice: Double
    
    var body: some View{
        VStack{
            HStack{
                Text("الاسم")
                Spacer()
                Text(name)
            }.padding()
            
            HStack{
                Text("الساعات")
                Spacer()
                Text(String(Int(numberOfHours)))
            }.padding()
            
            HStack{
                Text("رقم الهاتف")
                Spacer()
                Text(phone)
            }.padding()
            
            HStack{
                Text("المبلغ")
                Spacer()
                Text(String(totalPrice))
            }.padding()
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("ادفع الآن")
                    .frame(width: 330, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            })
        }.navigationBarTitle("الفاتورة")
    }
}
struct BicycleView: View{
    @State var name: String
    @State var phone: String
    @State var numberOfHours: Double
    @State var numberOfBicycles: Double
    
    let img: String
    
    var body: some View{
        VStack{
            Image(img)
                .resizable()
                .scaledToFit()
            TextField("اكتب اسمك هنا", text: $name)
                .padding()
            TextField("الهاتف", text: $phone)
                .padding()
            Stepper("عدد الساعات: \(numberOfHours, specifier: "%.0f")", value: $numberOfHours, in: 0...24)
                .padding()
            Stepper("عدد الدراجات: \(numberOfBicycles, specifier: "%.0f")", value: $numberOfBicycles, in: 0...10)
                .padding()
            Spacer()
            let totalPrice = (7.0 * numberOfHours) * numberOfBicycles
            Text("$\(totalPrice, specifier: "%.2f")")
            Text("المبلغ الكلي")
            
            if totalPrice > 0 {
                
                NavigationLink(
                    destination: PaymentView(name: name, numberOfHours: numberOfHours, phone: phone, totalPrice: totalPrice)
                    ,
                    label: {
                        Text("اضغط للمتابعة")
                            .frame(width: 330, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                    })
            }
        }
        
    }
}

struct BicyleRow: View {
    let txt: String
    let img: String
    
    var body: some View {
        HStack{
            Text(txt)
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(50)
            Image(img)
                .resizable()
                .scaledToFit()
                .frame(height:40)
        }
    }
}

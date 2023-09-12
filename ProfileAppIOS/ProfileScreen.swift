//
//  ProfileScreen.swift
//  ProfileAppIOS
//
//  Created by Bhavnesh Sharma on 12/09/23.
//

import SwiftUI

var gardNumber = 0

struct ProfileScreen : View{
    @State private var requestsCount = 200
    
        func getFollowerCount(_ requestCount: Int) -> String {
            gardNumber = requestCount
            var value = ""
            if(gardNumber == requestCount){
                gardNumber += 100
                value = "\(requestCount / 100)k"
            }
            return value
        }
    
    func getFolowing(_ value : String) -> String{
        let stringWithoutK = value.replacingOccurrences(of: "k", with: "")
        var intnum = Int(stringWithoutK)
        intnum! += 1
        return String(intnum! * 10)
    }
    
    var body: some View{
        ZStack{
            ScrollView{
                ZStack(alignment: .center){
                    Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                    VStack(alignment: .center){
                        VStack(alignment: .center){
                            Spacer()
                            Image("myImageboy")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 180, height : 180, alignment: .top)
                                .shadow(color: .pink, radius: 5,x: 5, y: 5)
                            Text("Bhavnesh Sharma")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.system(.largeTitle))
                                .shadow(radius: 80)
                            Text("Android | IOS | Flutter")
                                .foregroundColor(.white)
                                .font(.system(.body))
                                .padding(.bottom, 2)
                                .shadow(color: .pink ,radius: 8)
                            Text("Full Stack Mobile Developer")
                                .foregroundColor(.white)
                                .font(.system(.body))
                                .shadow(color: .pink ,radius: 8)
                            HStack(spacing: 40){
                                Image(systemName: "heart.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Image(systemName: "network")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Image(systemName: "message.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Image(systemName: "phone.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }.foregroundColor(.white)
                                .frame(width: 250, height: 50, alignment: .center)
                                .shadow(color: .pink, radius: 8)
                            Spacer()
                            VStack(alignment: .center, spacing: 30){
                                Button(action: {
                                    requestsCount += 1
                                }){
                                        RoundedRectangle(cornerRadius: 120)
                                            .frame(width: 200,height: 50, alignment: .center)
                                            .foregroundColor(.white)
                                            .shadow(color: .pink,radius: 8, y: 8)
                                            .overlay(Text("Follow")
                                                .fontWeight(.bold)
                                                .foregroundColor(.pink)
                                                .font(.system(size: 30))
                                                     
                                            )
                                    }.buttonStyle(PlainButtonStyle())
                                HStack(alignment: .center, spacing: 60){
                                    VStack{
                                        Text(getFollowerCount(requestsCount))
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.pink)
                                        Text("Followers")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                            .shadow(radius: 8)
                                    }
                                    VStack{
                                        Text(getFolowing( getFollowerCount( requestsCount)))
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.pink)
                                        Text("Following")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                            .shadow(radius: 8)
                                    }
                                    VStack{
                                        Text("\(requestsCount)")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.pink)
                                        Text("Request")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                            .shadow(radius: 8)
                                    }
                                }
                                Text("About Me")
                                    .font(.system(.largeTitle))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Text("Hi, I am a full-stack mobile app developer. I have extensive knowledge in Android, iOS, and Flutter. I have more than 3 years of experience. This profile app is just a SwiftUI test.")
                                    .font(.system(.body))
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(4)
                                    .opacity(0.7)
                            }
                        }.padding(.top, 0)
                    }.padding()
                }
            }
        }

    }
}

struct ProfileScreen_Preview: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

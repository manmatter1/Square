import SwiftUI

struct ThePrompt: View {
    

    // Define variables to hold the current truth and dare prompts
    
    @State var thePrompt = "Truth or Dare"
    @State var isTruth = true
    @State var buttonPressed = false
    
    @State private var feedback = UINotificationFeedbackGenerator()
    
    // efine a variable to hold the category caught
    @State var categoryCaught:String
    
    // Define a function to load the JSON data from prompts.json
    func loadJSONData() -> [Prompt] {
        guard let url = Bundle.main.url(forResource: "prompts", withExtension: "json") else {
            fatalError("Failed to locate prompts.json file in the app bundle.")
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let prompts = try decoder.decode([Prompt].self, from: data)
            return prompts
        } catch {
            fatalError("Failed to decode prompts.json: \(error)")
        }
    }
    
    // Define a function to find a random truth prompt from the given category
    func getRandomTruthPrompt(from category: String, prompts: [Prompt]) -> String {
        let filteredPrompts = prompts.filter { $0.category == category && $0.type == "Truth" }
        guard let randomPrompt = filteredPrompts.randomElement() else {
            fatalError("No truth prompts found in category \(category).")
        }
        return randomPrompt.prompt
    }
    
    // Define a function to find a random dare prompt from the given category
    func getRandomDarePrompt(from category: String, prompts: [Prompt]) -> String {
        let filteredPrompts = prompts.filter { $0.category == category && $0.type == "Dare" }
        guard let randomPrompt = filteredPrompts.randomElement() else {
            fatalError("No dare prompts found in category \(category).")
        }
        return randomPrompt.prompt
    }
    
    var body: some View {
        
        ZStack {
            BackgroundGradient()
             .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                ZStack {
                    if thePrompt == "Truth or Dare" {
                        AnimatedGradientRectangle()
                        .cornerRadius(15)
                        .frame(width: .infinity,height: .infinity)
                        .padding(.bottom)
                        .padding(20)
                    } else{
                        
                        Rectangle()
                            .cornerRadius(15)
                            .foregroundColor(gradientColor())
                            .frame(width: .infinity,height: .infinity)
                            .padding(.bottom)
                            .padding(20)
                            .shadow(radius: 20)
                            .glow(color: Color.yellow)
                        
                    }
                    
                        
                    
                
                    
                    Text("\(thePrompt)")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10.0)
                        .foregroundColor(.white)
                        .padding()
                        .id(thePrompt) // Add an id modifier to detect changes to thePrompt
                        .transition(.opacity)
                        .fontWeight(.medium)
                    
                      
                        
                        
                    
                }
                .padding(.bottom, 200.0)
                
                
                
                
                
                Spacer()
                
                //Buttons
                HStack{
                    Spacer()
                    Button(action: {
                        feedback.notificationOccurred(.success)
                        //change colour
                        isTruth = true
                        // Load the JSON data and find a random truth prompt from the chosen category
                        let prompts = loadJSONData()
                        thePrompt = getRandomTruthPrompt(from: categoryCaught, prompts: prompts)
                    }, label: {
                        Text("Truth")
                            .frame(width: 150,height: 75)
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(radius: 20)
                        
                    })
                    
                    Spacer()
                    
          
                    
                    
                    Button(action: {
                        feedback.notificationOccurred(.success)
                        //Chnage colour
                        isTruth = false
                        // Load the JSON data and find a random dare prompt from the chosen category
                        let prompts = loadJSONData()
                        thePrompt = getRandomDarePrompt(from: categoryCaught, prompts: prompts)
                    }, label: {
                        Text("Dare")
                            .frame(width: 150,height: 75)
                            .font(.title2)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(10)
                            .shadow(radius: 20)
                        
                    })
                    Spacer()
                }
                .padding(.bottom, 100.0)
                
            }
        }
    }
    
    // Function to determine gradient color based on button presses
    func gradientColor() -> Color {
        if thePrompt == "Truth or Dare" {
            // Use a gradient with blue and red colors
            return Color.orange.opacity(0.5) // Use only one color with opacity
        } else if isTruth {
            // Use blue color
            return Color.blue
        } else {
            // Use red color
            return Color.red
        }
    }


}
struct ThePrompt_Previews: PreviewProvider {
    static var previews: some View {
        ThePrompt(categoryCaught: "Teens")
    }
}

struct AnimatedGradientRectangle: View {
    @State private var gradientStart = UnitPoint(x: 0, y: 0)
    @State private var gradientEnd = UnitPoint(x: 1, y: 1)
    
    private let gradient = Gradient(colors: [.blue, .red])
    
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: gradient, startPoint: gradientStart, endPoint: gradientEnd))
            .frame(width: .infinity,height: .infinity)
            .cornerRadius(15)
            .animation(Animation.linear(duration: 2).repeatForever(autoreverses: true))
            .onAppear {
                gradientStart = UnitPoint(x: 1, y: 0)
                gradientEnd = UnitPoint(x: 0, y: 1)
            }
    }
}

struct BackgroundGradient: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var gradientStart = UnitPoint(x: 0, y: 0)
    @State private var gradientEnd = UnitPoint(x: 1, y: 1)
    
    private var gradient: Gradient {
        let colors: [Color] = [.orange, colorScheme == .dark ? .red : .pink]
        return Gradient(colors: colors)
    }
    
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: gradient, startPoint: gradientStart, endPoint: gradientEnd))
            .frame(width: .infinity, height: .infinity)
            .cornerRadius(15)
            .animation(Animation.linear(duration: 2).repeatForever(autoreverses: true))
            .onAppear {
                gradientStart = UnitPoint(x: 1, y: 0)
                gradientEnd = UnitPoint(x: 0, y: 1)
            }
    }
}


// Define a struct to represent a prompt in the JSON data
struct Prompt: Codable {
    let type: String
    let prompt: String
    let category: String
    let value: Int
}

//Class for if it is Truth or not

class isTruthest: ObservableObject{
    @Published var isTruth = true
}

//glow efffect

struct Glow: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        ZStack{
            content
                .blur(radius: 50)
                .shadow(color: color, radius: 20)
            content
        }
    }
}

extension View{
    func glow(color: Color = .white) -> some View{
        modifier(Glow(color: color))
    }
}


//equivalente de interfaz
protocol MediaProtocol{
  var title: String {get set}
  var price: Int {get set}
  var hd: Bool {get set}
}

//usamos structs para la definicion de objetos poco complejos
struct Resolution{
  var width = 0
  var height = 0
}

/*la clase video implementa el protocolo MediaProtocol, se define esto
 * mediante el operador ":"
 */
public class Video: MediaProtocol{
  //instanciacion, notese que el operador es el mismo para structs y clases
  var resolution = Resolution()
  var title: String
  var price: Int
  var hd: Bool

  /* constructor o inicializador, todas las clases deben tener al menos un
   * constructor que contenga todas las variables internas
   */
  public init(title: String, price: Int, hd: Bool){

    //accedemos a variables propias de la clase mediante "self"
    self.hd = hd
    self.title = title
    self.price = price
    adjustResolution()
  }

    /* constructor opcional, no requiere de todas las variables,
     * pero a su interior las inicializa con ayuda del constructor principal
     */
    public convenience init(title: String, price: Int){
    self.init(title: title, price: price, hd: false)
  }
  /*control de acceso mediante la palabra reservada "private"*/
  private func adjustResolution(){
    if hd{
      self.resolution.width = 1920
      self.resolution.height = 1080
    }
    else{
      self.resolution.width = 640
      self.resolution.height = 480
    }
   }
    public func setHd(){
        self.hd = true
        adjustResolution()
    }
    /*el operador "->" nos indica el tipo del valor de retorno*/
    public func enjoy() -> String{
        return "disfrutando del video \(self.title)"
    }
}

/*Herencia de clases, para ello se hace uso del operador ":" nuevamente*/
public class Movie: Video{
    var director: String
    var length: Int
    public init(title: String, price: Int, hd: Bool, director: String, length: Int){
        self.director = director
        self.length = length
        super.init(title: title, price: price, hd: hd)
    }
    /*Override de funciones, polimorfismo*/
    override public func enjoy() -> String{
        return "disfrutando de la pelicula \(self.title) del director \(self.director) me costo \(self.price) dolares, dura \(self.length) minutos"
    }
}

public class Game: Video{
    var publisher: String
    var genre: String
    var platform: String
    public init(title: String, price: Int, hd: Bool, publisher: String, genre: String, platform: String){
        self.publisher = publisher
        self.genre = genre
        self.platform = platform
        super.init(title: title, price: price, hd: hd)
    }

    override public func enjoy() -> String{
        return "disfrutando del juego \(self.title) de la casa \(self.publisher), me costo \(self.price) dolares, es del genero \(self.genre) y lo juego en la plataforma \(self.platform)"
    }
}



//instanciacion
let trainspotting = Movie(title: "trainspotting", price: 12, hd: true, director: "Danny Boyle", length: 90)
print(trainspotting.enjoy())
let metroid = Game(title: "metroid", price: 30, hd: true, publisher: "Nintendo", genre: "action-adventure", platform: "NES")
print(metroid.enjoy())

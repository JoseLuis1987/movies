# MOVIES IOS 

Aplicación iOS que permite a consultar listado de peliculas y su detalle .

### Características

  - Aplicación orientada a usuarios  
  - Representa la versión móvil de su [sitio Web](https://www.themoviedb.org/)
  - Optimizada para dispositivos iPhone &  ipad
  - La ejecución de sus principales funciones son totalmente en online
  
### Funcionalidades principales

A continuación se listan las principales funciones que permite ejecutar la aplicación:

  - Autenticación con token
  - Listado de peliculas  
  - Detalle de peliculas  
   


### Aspectos técnicos


Se agregan los siguentes dependencias (Pods)
  - Alamofire    : Se utilizo para la conexion de servicios.
  - ObjectMapper : Se agrega para el mapeo de las respuestas.
  - Kingfisher   : Se agrega para la carga de imagenes via URL y cache.
  - KeychainSwift: Se agrega para guardar el token de respuesta de los servicios.
  - PKHUD        : Se agrega para la interfaz , indicador de petición en espera.
  - SwiftyJSON   : Se agrega para el parseo JSON 

** Notas: **
-Por cuestion de tiempo , falta integrar la parte de filtrados y almacenamiento local. 

** **
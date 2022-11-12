# Ejemplo completo de Clean Architecture MVVM

Se habla mucho de clean architecture y tal vez como a mi os ha pasado que no habéis llegado a entender los por qué detrás de ella.

## Explicación general

Clean architecture no es un concepto nuevo como podemos ver en https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html . 

![imagen clean architecture](README/CleanArchitecture.jpeg)

Básicamente tenemos que tener claro un concepto y es Dependencia tenemos que aislar las dependencias de nuestro código entre capas para aislar y crear solo una dirección de dependencias que va de la capa más externa a la más interna.

## Estructura del proyecto 

Al igual que la descripción del sistema de capa debe especificar y describir que hace cada uno de estas, debemos trasladar a nuestro proyecto el mismo comportamiento. Para ello crearemos una serie de carpetas que contendrán la lógica de cada uno de estas capas.

### Principales carpetas

Esta seria la distribución de carpetas que contendrán nuestro proyecto.

```
├── Core
├── Data
├── DI
├── Domain
└── Presentation
```

### Visión detallada y descripción

Cada uno estos componentes tiene una función y no deben mezclarse entre ellos. Teniendo claro donde debe de ir cada una de las lógicas que implementemos.

```
├── Core
├── Data
|   ├── DTO
│   └── Repository
├── Di
├── Domain
│    ├── UseCase
│    └── Entity
└── Presentation
    ├── App
    └── Modules
```

- **Core**: esta capa se encarga de almacenar todos aquellos componentes que sean comunes a todas las capas. Por ejemplo: Constantes, datos de configuración etc.
- **Data**: esta capa es la que contendrá todos los componentes que se encarguen de obtener y almacenar información.
    - **DTO**: almacenaremos todos los Data Transfer Object (DTO)
    - **Repository**: contiene todas implementaciones para obtener datos ya sea de una API o de una base de datos
- **DI**: esta capa contiene la inyección de dependencias de nuestro proyecto que se utiliza a lo largo de la app. En nuestro caso contendrá el Container.swift que contine todas las dependencias del proyecto.
- **Domain**: esta capa se encarga de describir lo que hace el proyecto/aplicación mediante entidades y casos de uso.
    - **Entity**: almacenaremos todos los Data Transfer Object (DTO)
    - **UseCase**: Lista todas las funcionalidades de nuestra aplicación. Ejemplo: Get, Delete, Create , Update
- **Presentation**: La capa de presentación mantendrá todo lo relacionado con UI y su gestión.


## Autor

Fernando Salom

https://fernandosalom.es

https://www.linkedin.com/in/fsalom/

## Licencia
[MIT](https://choosealicense.com/licenses/mit/)

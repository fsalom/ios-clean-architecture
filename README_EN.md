# Complete Example of Clean Architecture MVVM

There's much talk about clean architecture, and perhaps, like me, you've found it difficult to understand the reasons behind it.

## General explanation

Clean Architecture is not a new concept, as we can see at https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html.

![Clean Architecture image](README/CleanArchitecture.jpeg)

Clean Architecture is a software design approach that aims to separate business logic from technical implementation details. Its goal is to create a robust and maintainable architecture that allows for easy evolution and extension of the system over time.

Clean architecture is based on the idea of dividing the code into independent layers of technical implementation, allowing for greater independence from infrastructure management and implementation details. This improves code readability and makes it easier to identify the parts of the application that need to be changed to make changes.

Clean architecture consists of four layers:

- The user interface layer, which interacts with the end user.
- The application layer, which handles the business logic of the application.
- The domain layer, which contains business rules and models.
- The infrastructure layer, which handles the connection of the application to its technical environment.

## Project Structure

Just as the layer system description should specify and describe what each of these does, we must transfer the same behavior to our project. To do this, we will create a series of folders that will contain the logic of each of these layers.


### Main Folders

This would be the distribution of folders that will contain our project.

```
├── Core
├── Data
├── DI
├── Domain
└── Presentation
```

## Detailed Vision and Description

Each of these components has a function and should not be mixed together. Knowing clearly where each of the logics we implement should go.

```
├── Core
├── Data
|   ├── DataSource
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


- **Data**: This layer is the one that will contain all the components that are responsible for obtaining and storing information.
    - **DataSource**: It is the mechanism by which we obtain the data from a specific source.
    - **Repository**: It contains all implementations to obtain data, either from an API or a database.
    
- **DI**: This layer contains the dependency injection of our project that is used throughout the app. In our case, it will contain the Container.swift file that contains all the dependencies of the project.

- **Domain**: esta capa se encarga de definir entidades y casos de uso por Dominio.
    - **Respositories**: These are the repository protocols.
    - **Entities**: These are models used beyond DTOs to manage databases or Core Data.
    - **UseCases**: Lists all the functionalities of our application. Example: Get, Delete, Create, Update.
    
- **Presentation**: The presentation layer will maintain everything related to UI and its management.

## Presentation Layer - Modules

Each module is composed of a series of files that must be implemented in each of them.

```
└── Presentation
    └── Modules
        ├── ToDoBuilder
        ├── ToDoProtocols
        ├── ToDoRouter
        ├── ToDoViewModel
        ├── ToDoViewController
        └── ToDoViewController(UI)
```

- **Builder**: Constructor of the viewController and its dependencies.

- **Protocols**: Responsible for declaring all the protocols that will be used in the application.   

- **Router**: Responsible for the navigation by the controller.

- **ViewController**: UI controller to manage the module's logic.

- **ViewController(UI)**: Visual layer of the controller.

## Using the Architecture

![imagen arquitectura](README/arquitectura.png)

The image describes the process of obtaining information and how it is transmitted throughout the modules.

The `datasource` is responsible for obtaining the data, whether it be from an API, local database, or any other data source.

The `repository` is responsible for deciding the logic for obtaining the data. For example, by querying local, obtaining from an API, or a combination of these.

The `use case` is responsible for performing the necessary operations to return the information needed by the viewModel. It contains a set of solutions to various situations, and each one of them solves one and only one specific task, resolving all its dependencies to be executed.

The `viewModel` obtains the information previously processed by the use case and executes the functions that are necessary, notifying the viewController to perform UI changes.

The `viewController` is responsible for executing actions related to the UI.

## Author

Fernando Salom

https://fernandosalom.es

https://www.linkedin.com/in/fsalom/

## License
[MIT](https://choosealicense.com/licenses/mit/)

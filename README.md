# Vet clinic database

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 vet clinic <a name="about-project"></a>

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **All the commands used are in the .sql files provided**
- **Easy to use for future projects, as files have comments explaining what is where and how to use it**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

Before running this project, make sure you have the following prerequisites installed:

<ul>
  <li>PostgreSQL</li>
  <li>Node.js</li>
  <li>Node.js</li>
</ul>

### Setup

1. Clone this repository to your desired folder:

   ```sh
   git clone https://github.com/sheezu900/vet-clinic.git
   ```

2. Navigate to the project directory:

    ```sh
    cd vet_clinic
    ```

### Database set up

Create a PostgreSQL database for the project (if not already created):

```sh
  createdb vet_clinic_db
  psql -U your_username -d vet_clinic_db -a -f database/schema.sql

```

### Usage

To run the project:

```sh
  npm start
```

### Run tests

To run tests after setting up the linters, run the following command:

```sh
  npx eslint "**/*.{js,jsx}"
```

```sh
  npx stylelint "**/*.{css,scss}"
```
## 👥 Author <a name="authors"></a>

👤 **Agneta Pupienyte**

- GitHub: [@githubhandle](https://github.com/sheezu900)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/shahzaman900/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

As this project progresses, I plan to implement the following features:

- **Create additional tables for related data.**
- **Define relationships between tables.**
- **Perform more advanced database operations, including joins.**

Stay tuned for updates and enhancements to the vet clinic database!


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/sheezu900/vet-clinic/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to extend my heartfelt gratitude to Microverse for providing me with the opportunity to undertake this project. Additionally, I am immensely thankful to the code reviewers who takes the time to assess my work and provide valuable feedback, which greatly contributed to the refinement and success of the project. Your guidance and support have been invaluable throughout this endeavor, and I am truly grateful for your contributions.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

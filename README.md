<h1 align="center">Node.js Starter ToolKit</h1>

<p align="center">
    <i>Starter Project for a Node.js application using <strong>TypeScript</strong> with all boring stuff already configured.</i>
</p>

<p align="center">
  <a href="https://github.com/vitorsalgado/create-nodejs-ts/actions/workflows/ci.yml">
    <img src="https://github.com/vitorsalgado/create-nodejs-ts/actions/workflows/ci.yml/badge.svg" alt="GitHub Action Status" />
  </a>
  <a href="https://www.npmjs.com/package/create-nodejs-ts">
    <img src="https://img.shields.io/npm/v/create-nodejs-ts.svg?logo=npm&logoColor=fff&label=NPM+package&color=limegreen" alt="npm" />
  </a>
  <a href="https://github.com/prettier/prettier">
    <img src="https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat" alt="Prettier"/>
  </a>
  <a href="https://conventionalcommits.org">
    <img src="https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg" alt="Conventional Commits"/>
  </a>
</p>

## Overview

Starter project for **Node.js** applications using **TypeScript** with test, lint, code formatter already configured.
Check the [tooling](#tooling) section for more details.  
The preferable way to use this boilerplate is using `npx` command. You can use `npm init` too.  
Use the following commands to bootstrap a new project:

### NPX

```
npx create-nodejs-ts --no --app=your-app
```

### NPM Init

```
npm init nodejs-ts -- --app=your-app
```

Without parameters, the project will be created on a folder **my-app** in the same directory where you executed the
command.  
All parameters available:

```
--destination=<FOLDER_DESTINATION> Defaults to the current directory
--app=<APP_NAME> Defaults to my-app
```

The final folder will the parameter `destination`, if provided, concatenated with the parameter `app`.

## ESM

The project template now uses **ESM** by default.

## Docker

Minimalist docker image generation.  
Check this [Dockerfile](build/docker/Dockerfile).

## Local Dev Environment

Run `make up` to spin up a local environment with **Docker Compose**.  
Check this [docker-compose.yml](deployments/dev/docker-compose.yml) for more details.

## CI/CD
Continuous Integration (CI) and Deployment Pipeline for Node.js Application

Implemented a robust CI/CD pipeline using GitHub Actions to automate the testing, building, and deployment process for a Node.js application hosted on AWS EC2 instances.

Key Responsibilities and Achievements:

Configured a CI pipeline to run tests, perform code linting, and ensure code formatting on every push to the main branch.
Leveraged GitHub Actions to automatically deploy the application to AWS EC2 instances upon successful tests and builds.
Utilized Terraform for provisioning AWS infrastructure, including EC2 instances, ensuring infrastructure as code (IaC) principles.
Orchestrated deployment tasks such as copying build artifacts to EC2 instances and executing necessary commands for application setup and launch using SSH.
Ensured high availability and reliability of the application by deploying it behind an Nginx reverse proxy and managing the application process with PM2.
This automated CI/CD pipeline significantly improved the development workflow, allowing for rapid and consistent delivery of new features and updates to the production environment.
## Tooling

- ESM
- TypeScript
- Jest
- EsLint
- Husky
- Commit Lint
- Lint Staged
- Prettier
- Nodemon
- Docker | Docker Compose

## License

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fvitorsalgado%2Fnodejs-boilerplate.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fvitorsalgado%2Fnodejs-boilerplate?ref=badge_shield)

This project is [MIT Licensed](LICENSE).

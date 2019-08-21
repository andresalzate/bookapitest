# bookapitest - Functional automated tests


## Execute

Ruby version install:

2.5.1

Gems:

```bash
bundle install
```
Default:

```bash
$ cucumber
```

Specific tag:

```bash
$ cucumber --tags @unit
```

# Configure

This project use dotenv to load the environment vars.

By default, when you execute `bin/setup` in the root of the projet, the setup command copy the `.env.example` to `.env` file path.

You can configure the project using the `.env` and to include a new configuration update and commit the `.env.example`

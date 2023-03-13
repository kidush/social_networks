# README

### Running the application:

**Ruby Version**: Despite I'm not using any new feature from Ruby 3.1, I would recommend use it =).

Install dependencies

```bash
bundle install
```

Running redis with docker:

```bash
docker run -d --name redis -p 6379:6379 redis
```

Spin up sidekiq

```bash
bundle exec sidekiq
```

Spin up rails server

```bash
bundle exec rails s
```

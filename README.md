# little-shoe

### Setup rails app

move to dashboard dir, and run

```
# This command will create the database, load the schema, and initialize it with the seed data
> ./bin/rails db:setup
```

### Start the app

In a termial run

```
# This command will start broadcasting inventory movements
> websocketd --port=8080 ruby inventory.rb
```

And in another terminal run

```
# This command will start the rails app
> ./bin/dev
```

visit `localhost:3000` to start monitoring the inventory moments for each store 

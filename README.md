# Quipu API Ruby Client

This gem is the official API client for the Quipu API v1


## Configuration

The client requires a client_id and client_secret, obtained from Quipu:

```ruby
Quipu.config do |conf|
  conf.client_id = 'foo'
  conf.client_secret = 'bar'
end
```

After configuring the client_id and client_secret, the client automatically
requests a token from the API using the client_credentials strategy, stores
it in the configuration and configures Quipu::Base.connection with
FaradayMiddleware::Oauth2 so that this saved token is passed on every request, thus
granting access.

The access token can also be configured independently from an external source
and passed to the client:

```ruby
Quipu.config do |conf|
  conf.token = 'token'
end
```

The base URL for the API can be changed on the configuration too, to account for different
environments:

```ruby
Quipu.config do |conf|
  conf.base_url = 'http://getquipu.local'
end
```

## Usage
The gem is based on [json_api_client](https://github.com/chingor13/json_api_client/),
 and as such it should work out of the box with all methods that json_api_client supports


The models and operations supported are the ones exposed by the API
 (docs [here](http://quipuapp.github.io/api-v1-docs))

## Examples

```ruby
# List all Invoices, pagination per 20
Quipu::Invoice.all
```

```ruby
# List all Invoices, include items
Quipu::Invoice.includes(:items).all
```

TODO: Evaluation of creations of Invoices/Tickets/Paysheets. Of special
interest, since the API breaks off from the JSON API standard in this regard (it
requires inline inclusion of the items as the only way of creating an item),
and so there's a fair chance that json_api_client will not support this kind of
operation.

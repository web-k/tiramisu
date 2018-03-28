const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const coffee =  require('./loaders/coffee')
const erb =  require('./loaders/erb')

environment.loaders.append('erb', erb)
environment.loaders.append('coffee', coffee)

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    "window.jQuery": 'jquery',
    jquery: 'jquery'
  })
)

module.exports = environment

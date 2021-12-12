const { environment } = require('@rails/webpacker')
const webpack = require("webpack")

// import our loaders.
const datatables = require("./loaders/datatables");
const jquery = require("./loaders/jquery");

// append them to webpack loaders.
environment.loaders.append("datatables", datatables);
// environment.loaders.append("expose", jquery);

environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    // Popper: ['popper.js', 'default']
  })
)
module.exports = environment


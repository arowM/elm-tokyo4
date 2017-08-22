const path              = require('path');
const webpack           = require('webpack');
const merge             = require('webpack-merge');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

console.log('Starting webpack process...');

// Determine build env by npm command options
const TARGET_ENV = process.env.npm_lifecycle_event === 'build' ? 'production' : 'development';
const ENV = {
  'port': process.env.PORT || 8080,
  'host': process.env.HOST || 'localhost',
  'title': process.env.TITLE || '複雑化するUIにどう立ち向かうか - Elmの思想に学ぶ現代的なWebフロントエンド開発手法',
};
const isDev = TARGET_ENV === 'development';

// Common webpack config
const commonConfig = {

  output: {
    path: path.resolve(__dirname, 'docs/'),
    filename: '[name].js',
    publicPath: isDev ? '/' : '/elm-tokyo4/',
  },

  entry: {
    'style-guide': [
      path.join( __dirname, 'src/StyleGuide/index.js' )
    ],
    'presentation': [
      path.join( __dirname, 'src/Presentation/index.js' )
    ],
  },

  resolve: {
    extensions: ['.js', '.elm'],
    modules: [
      'node_modules'
    ],
  },

  module: {
    rules: [
      {
        test: /\.(eot|ttf|woff|woff2|svg)$/,
        use: 'file-loader',
      },
      {
        test: /\.(jpg|jpeg|png)$/,
        use: 'url-loader'
      },
    ]
  },

  plugins: [
    new HtmlWebpackPlugin({
      chunks: ['style-guide'],
      template: 'src/StyleGuide/index.html',
      inject:   'body',
      filename: 'style-guide/index.html',
      data: ENV,
      hash: true,
      minify: {
        collapseInlineTagWhitespace: true,
        collapseWhitespace: true,
        html5: true,
        removeComments: true,
      },
    }),
    new HtmlWebpackPlugin({
      chunks: ['presentation'],
      template: 'src/Presentation/index.html',
      inject:   'body',
      filename: 'presentation/index.html',
      data: ENV,
      hash: true,
      minify: {
        collapseInlineTagWhitespace: true,
        collapseWhitespace: true,
        html5: true,
        removeComments: true,
      },
    }),

    // Inject variables to JS file.
    new webpack.DefinePlugin({
      'process.env':
        Object.keys(ENV).reduce((o, k) =>
          merge(o, {
            [k]: JSON.stringify(ENV[k]),
          }), {}
        ),
    }),
  ],

}

// Settings for `npm start`
if (TARGET_ENV === 'development') {
  console.log('Serving locally...');

  module.exports = merge(commonConfig, {

    devServer: {
      contentBase: 'src',
      inline: true,
      port: ENV.port,
      host: ENV.host,
    },

    module: {
      rules: [
        {
          test:    /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          use: [
            {
              loader: 'elm-hot-loader',
            },
            {
              loader: 'elm-css-modules-loader',
            },
            {
              loader: 'elm-webpack-loader',
              options: {
                verbose: true,
                warn: true,
              }
            },
          ],
        },
        {
          test: /\.(css|scss)$/,
          include: [/src\/Atom\/styles/],
          use: [
            'style-loader',
            { 'loader': 'css-loader',
              'options':
                { 'modules': 'ture' },
            },
            { 'loader': 'sass-loader',
              'options': {
                'includePaths': [
                  path.resolve(__dirname, 'src/Atom/styles/'),
                ],
              },
            },
            'postcss-loader',
          ]
        },
        {
          test: /\.(css|scss)$/,
          exclude: [/src\/Atom\/styles/],
          use: [
            'style-loader',
            { 'loader': 'css-loader',
            },
            { 'loader': 'sass-loader',
              'options': {
                'includePaths': [
                  path.resolve(__dirname, 'src/Atom/styles/'),
                ],
              },
            },
            'postcss-loader',
          ]
        },
      ]
    }
  });
}

// Settings for `npm run build`.
if (TARGET_ENV === 'production') {
  console.log('Building for prod...');

  module.exports = merge(commonConfig, {

    module: {
      rules: [
        {
          test:    /\.elm$/,
          exclude: [/elm-stuff/, /node_modules/],
          use: [
            {
              loader: 'elm-css-modules-loader',
            },
            {
              loader: 'elm-webpack-loader',
            },
          ],
        },
        {
          test: /\.(css|scss)$/,
          include: [/src\/Atom\/styles/],
          use: ExtractTextPlugin.extract({
            fallback: 'style-loader',
            use: [
              { 'loader': 'css-loader',
                'options':
                  { 'modules': 'ture' },
              },
              { 'loader': 'sass-loader',
                'options': {
                  'includePaths': [
                    path.resolve(__dirname, 'src/Atom/styles/'),
                  ],
                },
              },
              'postcss-loader',
            ]
          }),
        },
        {
          test: /\.(css|scss)$/,
          exclude: [/src\/Atom\/styles/],
          use: ExtractTextPlugin.extract({
            fallback: 'style-loader',
            use: [
              { 'loader': 'css-loader',
              },
              { 'loader': 'sass-loader',
                'options': {
                  'includePaths': [
                    path.resolve(__dirname, 'src/Atom/styles/'),
                  ],
                },
              },
              'postcss-loader',
            ]
          }),
        },
      ]
    },

    plugins: [
      new CopyWebpackPlugin([
      ]),

      // Extract CSS into a separate file
      new ExtractTextPlugin({ filename: './[hash].css', allChunks: true }),

      // Minify & mangle JS/CSS
      new webpack.optimize.UglifyJsPlugin({
          minimize:   true,
          compressor: { warnings: false }
          // mangle:  true
      }),
    ]
  });
}

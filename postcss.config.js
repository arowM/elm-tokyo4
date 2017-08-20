module.exports = {
  plugins: [
    require('stylelint'),
    require('autoprefixer'),
    require('postcss-flexbugs-fixes'),
    require('postcss-reporter')({ clearMessages: true }),
  ],
};

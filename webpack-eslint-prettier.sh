#!/bin/sh
npm init -y
npm install webpack webpack-cli --save-dev
npm install --save-dev style-loader css-loader
touch webpack.config.js
echo " const path = require('path');

 module.exports = {
   entry: './src/index.js',
   output: {
     filename: 'bundle.js',
     path: path.resolve(__dirname, 'dist'),
   },
   module: {
     rules: [
       {
         test: /\.css$/i,
         use: ['style-loader', 'css-loader'],
       },
       {
         test: /\.(png|svg|jpg|jpeg|gif)$/i,
         type: 'asset/resource',
       },
      {
        test: /\.(woff|woff2|eot|ttf|otf)$/i,
        type: 'asset/resource',
      },
     ],
   },
 };" >> webpack.config.js

mkdir dist src
touch dist/index.html src/index.js

echo " <!DOCTYPE html>
 <html>
   <head>
     <meta charset="utf-8" />
    <title>Project</title>
   </head>
   <body>
    <script src="bundle.js"></script>
   </body>
 </html>" >> dist/index.html

npm install eslint --save-dev
./node_modules/.bin/eslint --init
npm install --save-dev --save-exact prettier
echo {}> .prettierrc.json
npx prettier --write .
npm install --save-dev eslint-config-prettier
sed -i 's/"airbnb-base"/&, "prettier"/' .eslintrc.json "airbnb-base", "prettier"]
rm -- "$0"
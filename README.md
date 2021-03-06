# CSCZ-Boilerplate
### Our take on (now abandoned) CS-Cart Boilerplate theme

This is a skeleton theme for developing custom shops from ground up. No more hassle with the Responsive theme!

**Please note that it's still work in progress and bugs can occur. Feel free to open issues to report bugs or contribute with a PR.**

Notable differences from original Boilerplate:
- SUPPORT FOR CURRENT CS-CART VERSIONS
- Theme uses SCSS instead of LESS
- Uses NPM + Gulp for precompiling, supports browser Livereload
- Uses Bootstrap 4 instead of BS3
- Uses Swiper for banner / product sliders
- Theme editor support
- Recaptcha support
- Supports modern Lite Checkout

Not implemented (PR welcome):
- Quick view

This theme is, just like the original Boilerplate, meant for development. The goal is for it to be fully compatible with latest versions of CS-Cart (currently version 4.x).

## Installation
1. Copy **cscz-boilerplate** and **example_child_theme** directories to your project's design/themes path. 
2. (optional) Head over to **example_child_theme**, open file **manifest.json** and change title and description to fit your project. You can also change **customer_screenshot.png**.
3. (optional) Rename **example_child_theme** to your project's name, ie "your_project_theme"
4. Go to the CS-Cart administration panel, and on the Design → Themes page select your child theme.
5. Go to your child theme and run npm to install scss and gulp:
  ```bash
  cd design/themes/example_child_theme
  npm install
  ```
6. Next time you will only need to run gulp to start watching changes:
  ```bash
  cd design/themes/example_child_theme
  gulp
  ```

## Copyright and License
Licensed under the MIT license just like the original CS-Cart Boilerplate.

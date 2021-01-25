# CSCZ-Boilerplate
### Our take on (now abandoned) CS-Cart Boilerplate theme

Notable differences from original Boilerplate:
- Theme uses SCSS instead of LESS
- Uses NPM + Gulp for precompiling, supports browser Livereload
- Uses Bootstrap 4 instead of BS3
- Uses Swiper for banner / product sliders

This theme is, just like the original Boilerplate, meant for development. The goal is for it to be fully compatible with latest versions of CS-Cart (currently version 4.x). Keep an eye on the repository, there should be a usable release soon together with an example child theme.

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

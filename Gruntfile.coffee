module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      compile:
        options:
          sourceMap: true
          bare: true
        files:[
          expand: true
          cwd: 'src/'
          src: ['**/*.coffee']
          dest: './'
          ext: '.js'
        ]
    watch:
      coffeeCompile:
        files: ['src/**/*.coffee']
        tasks: ['coffee', 'browserify', 'uglify']
      hamlCompile:
        files: ['src/haml/**/*.haml']
        tasks: ['haml']
      sassCompile:
        files: ['src/sass/**/*.scss']
        tasks: ['sass']
    haml:
      compile:
        files:[
          expand: true
          cwd: 'src/haml/'
          src: ['**/*.haml']
          dest: './'
          ext: '.html'
        ]
    sass:
      compile:
        options:
          sourcemap: 'auto'
          update: true
          style: 'compact'
          loadPath: 'vendor/bootstrap/stylesheets'
        files:[
          expand: true
          cwd: 'src/sass/'
          src: '**/*.scss'
          dest: 'css/'
          ext: '.css'
        ]
    browserify:
      encryptor:
        src: ['lib/encryptor.js']
        dest: 'js/encryptor.js'
      options:
        browserifyOptions:
          debug: true
          standalone: 'encryptor'
    uglify:
      options:
        sourceMap: true
      compile:
        files:[
          expand: true
          cwd: 'js/'
          src: '*.js'
          dest: 'js/min/'
          ext: '.min.js'
        ]

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-haml2html'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-browserify'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.registerTask 'default', ['coffee', 'haml', 'sass', 'browserify', 'uglify']

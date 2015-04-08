module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      compile:
        options:
          sourceMap: true
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
        tasks: ['coffee', 'browserify']
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
          cwd: 'src/'
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
        files:[
          expand: true
          cwd: 'src/sass/'
          src: '**/*.scss'
          dest: 'css/'
          ext: '.css'
        ]
    browserify:
      standalone:
        src: ['lib/encryptor.js']
        dest: 'js/encryptor.js'
        options:
          browserifyOptions:
            standalone: 'encryptor'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-haml2html'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-browserify'

  grunt.registerTask 'default', ['coffee', 'haml', 'sass', 'browserify']

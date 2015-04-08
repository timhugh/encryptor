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
      scripts:
        files: ['src/**/*.coffee']
        tasks: ['coffee']
      templates:
        files: ['src/*.haml']
        tasks: ['haml']
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

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-haml2html'
  grunt.loadNpmTasks 'grunt-contrib-sass'

  grunt.registerTask 'default', ['coffee']

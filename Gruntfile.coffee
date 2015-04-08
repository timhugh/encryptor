module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      compile:
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

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-haml2html'

  grunt.registerTask 'default', ['coffee']

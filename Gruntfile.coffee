module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      dynamic_mappings:
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

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['coffee']

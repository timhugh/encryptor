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

  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.registerTask 'default', ['coffee']

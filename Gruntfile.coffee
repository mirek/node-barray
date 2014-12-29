
module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-mocha-test'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      compile:
        files:
          'lib/index.js': 'src/index.coffee'

    watch:
      coffee:
        files: [ 'src/index.coffee' ]
        tasks: [ 'coffee' ]

    mochaTest:
      all:
        options:
          reporter: 'spec'
          require: [
            'coffee-script/register'
          ]
        src: ['spec/**/*.coffee']
      one:
        options:
          bail: true # Fail early on single test so it's easy to inspect db state.
          require: [
            'coffee-script/register'
          ]
        src: [ ]
  grunt.registerTask 'test', (name) ->
    switch name
      when undefined, 'all'
        grunt.task.run 'mochaTest:all'
      else
        if name.indexOf('/') isnt -1
          [ dirname, basename ] = name.split '/'
          path = "spec/#{dirname}/spec-#{basename}.coffee"
        else
          path = "spec/spec-#{name}.coffee"

        grunt.log.writeln "Testing #{path}"
        grunt.config.set 'mochaTest.one.src', [ path ]
        grunt.task.run [ 'mochaTest:one' ]

  grunt.registerTask 'compile', [ 'coffee' ]
  grunt.registerTask 'default', [ 'compile' ]

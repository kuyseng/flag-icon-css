module.exports = (grunt)->
  sass = 'sass'
  TARGET_DIR = 'css'

  grunt.initConfig
    sass:
      flag:
        src: 'sass/flag-icon.scss'
        dest: 'css/flag-icon.css'
      docs:
        src: 'assets/docs.scss'
        dest: 'assets/docs.css'

    cssmin:
      flag:
        src: 'css/_flag-icon.scss'
        dest: 'css/flag-icon.min.css'

    watch:
      css:
        options:
          livereload: true
        files: '**/*.scss'
        tasks: ['build']

      assets:
        options:
          livereload: true
        files: ['index.html', 'assets/*']

    connect:
      server:
        options:
          port: 8000
          keepalive: true


    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-cssmin'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-connect'

    grunt.registerTask 'build',   ['sass', 'cssmin']
    grunt.registerTask 'default', ['build', 'watch']

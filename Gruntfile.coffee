module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"

    sqsp:
      options:
        navigations:
          mainNav:
            title: "Navigation"
            # international: true
          footerNav:
            title: "Footer Navigation"
        buildDir: 'build'
        themeDir: 'theme'
      staging:
        options:
          buildDir: 'build-staging'
          staging: true
          domain: '<%= pkg.sqspStagingSubdomain %>'
          remote: 'https://<%= pkg.sqspStagingSubdomain %>.dev.squarespace.com/template.git'
      prod:
        options:
          buildDir: 'build-prod'
          domain: '<%= pkg.sqspSubdomain %>'
          remote: 'https://<%= pkg.sqspSubdomain %>.dev.squarespace.com/template.git'

  grunt.loadNpmTasks('grunt-sqsp')

  grunt.registerTask("stage", ["sqsp:staging:build", "sqsp:staging:deploy"])
  grunt.registerTask("default", "stage")

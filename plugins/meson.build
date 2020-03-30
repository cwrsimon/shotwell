# Plugin helper library

sw_plugin_common_deps = [gtk, gee, soup, xml, sw_plugin]

webkit_sources = []
if webkit.found()
sw_plugin_common_deps += [webkit]
webkit_sources = ['common/WebAuthenticationPane.vala']
endif

sw_plugin_common = library('shotwell-plugin-common',
                          ['common/RESTSupport.vala',
                           'common/Resources.vala',
                           'common/BuilderPane.vala',
                           'common/OAuth1Support.vala'] + webkit_sources,
                          version: meson.project_version(),
                          dependencies : sw_plugin_common_deps,
                          vala_header : 'shotwell-plugin-common.h',
                          vala_vapi : 'shotwell-plugin-common.vapi',
                          include_directories : config_incdir,
                          install : true)

sw_plugin_common_dep = declare_dependency(include_directories : include_directories('.'),
                                          link_with : sw_plugin_common)

if webkit.found()
subdir('authenticator')
subdir('shotwell-publishing')
if get_option('extra-plugins')
  subdir('shotwell-publishing-extras')
endif
endif
subdir('shotwell-transitions')

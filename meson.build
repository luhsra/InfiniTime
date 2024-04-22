project('InfiniTime', 'c',
  version : '0.1',
  default_options : ['warning_level=3'])

# this is just to satisfy Meson until https://github.com/mesonbuild/meson/issues/12451 is fixed
infinitime_dir = meson.project_source_root()
freertos_config = files('src' / 'FreeRTOSConfig.h')[0]
translation_map = files('function_pointer_translation_map.json')[0]

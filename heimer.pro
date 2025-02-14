# Qt project file to cross-compile the editor for Windows with MXE
# (there are problems with static Qt and CMake)

TEMPLATE = app
TARGET = heimer

DEFINES += VERSION=\\\"2.4.0\\\"
DEFINES += PACKAGE_TYPE=\\\"$$(PACKAGE_TYPE)\\\"

CONFIG += c++14 lrelease embed_translations

# Qt version check
contains(QT_VERSION, ^[5-6]\\..*) {
    message("Building for Qt version $${QT_VERSION}.")
    QT += widgets svg xml
} else {
    error("Qt5 or Qt6 is required!")
}

SRC = src

INCLUDEPATH += . $$SRC/contrib/SimpleLogger/src $$SRC/contrib/Argengine/src

# Input
HEADERS +=  \
    $$SRC/about_dlg.hpp \
    $$SRC/alz_serializer.hpp \
    $$SRC/application.hpp \
    $$SRC/defaults_tab.hpp \
    $$SRC/graph.hpp \
    $$SRC/graphics_factory.hpp \
    $$SRC/grid.hpp \
    $$SRC/edge.hpp \
    $$SRC/edge_context_menu.hpp \
    $$SRC/edge_dot.hpp \
    $$SRC/edge_text_edit.hpp \
    $$SRC/editing_tab.hpp \
    $$SRC/editor_data.hpp \
    $$SRC/editor_scene.hpp \
    $$SRC/editor_view.hpp \
    $$SRC/file_exception.hpp \
    $$SRC/hash_seed.hpp \
    $$SRC/image.hpp \
    $$SRC/image_manager.hpp \
    $$SRC/png_export_dialog.hpp \
    $$SRC/layers.hpp \
    $$SRC/layout_optimization_dialog.hpp \
    $$SRC/layout_optimizer.hpp \
    $$SRC/magic_zoom.hpp \
    $$SRC/main_context_menu.hpp \
    $$SRC/main_window.hpp \
    $$SRC/mediator.hpp \
    $$SRC/mind_map_data.hpp \
    $$SRC/mind_map_data_base.hpp \
    $$SRC/mouse_action.hpp \
    $$SRC/node.hpp \
    $$SRC/node_handle.hpp \
    $$SRC/recent_files_manager.hpp \
    $$SRC/recent_files_menu.hpp \
    $$SRC/selection_group.hpp \
    $$SRC/settings.hpp \
    $$SRC/settings_dialog.hpp \
    $$SRC/settings_proxy.hpp \
    $$SRC/state_machine.hpp \
    $$SRC/svg_export_dialog.hpp \
    $$SRC/test_mode.hpp \
    $$SRC/text_edit.hpp \
    $$SRC/undo_stack.hpp \
    $$SRC/whats_new_dlg.hpp \
    $$SRC/widget_factory.hpp \
    $$SRC/xml_reader.hpp \
    $$SRC/xml_writer.hpp \
    $$SRC/contrib/Argengine/src/argengine.hpp \
    $$SRC/contrib/SimpleLogger/src/simple_logger.hpp \

SOURCES += \
    $$SRC/about_dlg.cpp \
    $$SRC/alz_serializer.cpp \
    $$SRC/application.cpp \
    $$SRC/defaults_tab.cpp \
    $$SRC/graph.cpp \
    $$SRC/graphics_factory.cpp \
    $$SRC/grid.cpp \
    $$SRC/edge.cpp \
    $$SRC/edge_context_menu.cpp \
    $$SRC/edge_dot.cpp \
    $$SRC/edge_text_edit.cpp \
    $$SRC/editing_tab.cpp \
    $$SRC/editor_data.cpp \
    $$SRC/editor_scene.cpp \
    $$SRC/editor_view.cpp \
    $$SRC/hash_seed.cpp \
    $$SRC/image.cpp \
    $$SRC/image_manager.cpp \
    $$SRC/png_export_dialog.cpp \
    $$SRC/layout_optimization_dialog.cpp \
    $$SRC/layout_optimizer.cpp \
    $$SRC/magic_zoom.cpp \
    $$SRC/main.cpp \
    $$SRC/main_context_menu.cpp \
    $$SRC/main_window.cpp \
    $$SRC/mediator.cpp \
    $$SRC/mind_map_data.cpp \
    $$SRC/mind_map_data_base.cpp \
    $$SRC/mouse_action.cpp \
    $$SRC/node.cpp \
    $$SRC/node_handle.cpp \
    $$SRC/recent_files_manager.cpp \
    $$SRC/recent_files_menu.cpp \
    $$SRC/selection_group.cpp \
    $$SRC/settings.cpp \
    $$SRC/settings_dialog.cpp \
    $$SRC/settings_proxy.cpp \
    $$SRC/state_machine.cpp \
    $$SRC/svg_export_dialog.cpp \
    $$SRC/test_mode.cpp \
    $$SRC/text_edit.cpp \
    $$SRC/undo_stack.cpp \
    $$SRC/whats_new_dlg.cpp \
    $$SRC/widget_factory.cpp \
    $$SRC/xml_reader.cpp \
    $$SRC/xml_writer.cpp \
    $$SRC/contrib/Argengine/src/argengine.cpp \
    $$SRC/contrib/SimpleLogger/src/simple_logger.cpp \

QM_FILES_RESOURCE_PREFIX = /translations

TRANSLATIONS += \ 
$$SRC/translations/heimer_fi.ts \ 
$$SRC/translations/heimer_fr.ts \ 
$$SRC/translations/heimer_it.ts \
$$SRC/translations/heimer_nl.ts 

RESOURCES += meta.qrc data/icons/icons.qrc data/images/images.qrc
RC_FILE = data/icons/WindowsHeimer.rc

data.files = AUTHORS CHANGELOG COPYING README

target.path = $$OUT_PWD/../..
INSTALLS += target


; example makefile
; ----------------
; This is an example makefile to introduce new users of drush_make to the
; syntax and options available to drush_make. For a full description of all
; options available, see README.txt.
api = 2
; This make file is a working makefile - try it! Any line starting with a `;`
; is a comment.

; Core version
; ------------
; Each makefile should begin by declaring the core version of Drupal that all
; projects should be compatible with.

core = 7.x

; Core project
; ------------
; In order for your makefile to generate a full Drupal site, you must include
; a core project. This is usually Drupal core, but you can also specify
; alternative core projects like Pressflow. Note that makefiles included with
; install profiles *should not* include a core project.

projects[] = drupal

; Projects
; --------
; Each project that you would like to include in the makefile should be
; declared under the `projects` key. The simplest declaration of a project
; looks like this:

projects[views][subdir] = contrib
projects[features][subdir] = contrib
projects[ctools][subdir] = contrib
projects[wysiwyg][subdir] = contrib
projects[strongarm][subdir] = contrib
projects[features_extra][subdir] = contrib
projects[uuid][subdir] = contrib
projects[uuid_features][subdir] = contrib
projects[token][subdir] = contrib
projects[pathauto][subdir] = contrib
projects[admin_menu][subdir] = contrib
projects[context][subdir] = contrib
projects[context_error][subdir] = contrib
projects[rules][subdir] = contrib
projects[field_group][subdir] = contrib
projects[date][subdir] = contrib
projects[diff][subdir] = contrib
projects[entity][subdir] = contrib
projects[entityreference][subdir] = contrib
projects[module_filter][subdir] = contrib
projects[libraries][subdir] = contrib
projects[jquery_update][subdir] = contrib
projects[entitycache][subdir] = contrib
projects[views_bulk_operations][subdir] = contrib

projects[bootstrap][type] = theme

libraries[ckeditor][download][type] = get
libraries[ckeditor][download][url] = http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.1.1/ckeditor_4.1.1_standard.zip

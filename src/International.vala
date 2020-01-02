/* Copyright 2016 Software Freedom Conservancy Inc.
 *
 * This software is licensed under the GNU LGPL (version 2.1 or later).
 * See the COPYING file in this distribution.
 */

extern const string _LANG_SUPPORT_DIR;

public const string TRANSLATABLE = "translatable";

namespace InternationalSupport {
const string SYSTEM_LOCALE = "";
const string LANGUAGE_SUPPORT_DIRECTORY = _LANG_SUPPORT_DIR;

void init(string package_name, string[] args, string locale = SYSTEM_LOCALE) {
    Intl.setlocale(LocaleCategory.ALL, locale);
    
    Intl.bindtextdomain(package_name, get_langpack_dir_path(args));
    Intl.bind_textdomain_codeset(package_name, "UTF-8");
    Intl.textdomain(package_name);
}

private string get_langpack_dir_path(string[] args) {
    File base_dir = File.new_for_path(Environment.find_program_in_path(args[0])).get_parent().get_parent();
    File local_langpack_dir =
        base_dir.get_child(
        "locale-langpack");

    string return_value = (local_langpack_dir.query_exists(null)) ? local_langpack_dir.get_path() :
        base_dir.get_child("share").get_child("locale").get_path();
    
    debug("%s\n", return_value);
    return return_value;
}
}


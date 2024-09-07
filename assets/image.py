#!/usr/bin/python
# -*- coding:utf8 -*-


import os
import sys

EXT_PATH = 'lib/r.dart'
path_image_list = []
path_image_file = []


def foreachFile(path):
    pathlist = os.listdir(path)
    for file in pathlist:
        pathfil = path + '/' + file
        if os.path.isdir(pathfil):
            path_image_file.append(pathfil)
            foreachFile(pathfil)
        else:
            path_image_list.append(pathfil)
    return


def path_msg_write(path):
    writemsg = ''
    for path_image in path_image_list:
        dart_path = path_image.replace((path + '/'), '')
        pathgroup = []
        pathgroup = dart_path.split('/')
        s1 = ''
        for paths1 in pathgroup:
            s1 += ('/' + paths1)

        s2 = 'assets'
        count = 0
        lenght = len(pathgroup)
        while count < lenght - 1:
            s2 += pathgroup[count].capitalize()
            count += 1
        s2 += pathgroup[lenght - 1].split('.')[0].capitalize()
        s2 = s2.replace(r'.', '')

        s3 = 'assets'
        for paths3 in pathgroup:
            s3 += ('/' + paths3)

        if os.path.isdir(s3) or len(convert(s2, "_"))<=0:
            continue
        rpc = '''/// ![](http://127.0.0.1:9527/assets%s)
        static const %s = '%s';
        ''' % (s1, convert(s2, "_"), s3)
        
        writemsg += rpc

    msg = '''class R {
        %s
        }''' % (writemsg)

    return msg


def write_dart(dart_path, path):
    file = open(dart_path, 'w')
    msg = path_msg_write(path)
    file.write(msg)
    file.close()
    return


def convert(one_string, space_character):
    string_list = str(one_string).split(space_character)
    first = string_list[0]
    others = string_list[1:]
    others_capital = [word.capitalize()
                      for word in others]
    others_capital[0:0] = [first]
    hump_string = ''.join(others_capital)
    hump_string = hump_string.replace('assetsImages', '')
    return "".join(hump_string[:1].lower() + hump_string[1:])

def write_yaml(path):
    path = path.replace(r"assets", '')
    yaml_path = path + 'pubspec.yaml'

    file = open(yaml_path, 'r')
    line = file.readlines()
    file.close()

    imageFilegrop = path.split('/')
    index = 0
    begin = 0
    writebool = True
    msg = []

    for yamlMsg in line:
        index += 1
        if '# assets-generator-begin' in yamlMsg:
            begin = index
            msg.append(yamlMsg)
            writebool = False
        if '# assets-generator-end' in yamlMsg:
            writebool = True
        if writebool == True:
            msg.append(yamlMsg)

    for path_file in path_image_file:
        dart_path = path_file.replace((path + '/'), '')
        pathgroup = []
        pathgroup = dart_path.split('/')[(len(imageFilegrop)):]
        str = '    - assets'
        for s in pathgroup:
            str += '/' + s
        str += '/\n'
        msg.insert(begin, str)
        begin += 1

    yamlfile = open(yaml_path, 'w')
    yamlfile.writelines(msg)
    yamlfile.close()
    return

def write_msg_yaml():
    return

if __name__ == "__main__":
    path = sys.path[0]
    foreachFile(path)
    dart_path = path.replace(r"assets", EXT_PATH)
    write_dart(dart_path, path)
    write_yaml(path)

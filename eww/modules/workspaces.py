#!/usr/bin/env python3

import subprocess
import json
import time

def get_workspaces():
    out = subprocess.check_output(["hyprctl", "-j", "workspaces"])
    return json.loads(out.decode("utf-8"))

def get_active_workspace():
    out = subprocess.check_output(["hyprctl", "-j", "activeworkspace"])
    return json.loads(out.decode("utf-8"))


def ret_workspace():
    res = []
    wsps_unsort = get_workspaces()
    awsp = get_active_workspace()
    wsps = sorted(wsps_unsort, key=lambda x:x['id'])
    for wsp in wsps:
        if wsp["id"] == awsp["id"]:
            res.append("●")
        else:
            res.append("○")
    print(" ".join(res))

ret_workspace()

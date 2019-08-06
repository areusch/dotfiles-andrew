#!/usr/bin/env python3.7

import AppKit
import iterm2

AppKit.NSWorkspace.sharedWorkspace().launchApplication_("iTerm")

async def main(connection):
    app = await iterm2.async_get_app(connection)

    # Foreground the app
    await app.async_activate()

    all_profiles = await iterm2.PartialProfile.async_query(connection)
    for profile in all_profiles:
        if profile.name == "Andrew":
            await profile.async_make_default()
            return

iterm2.run_until_complete(main, retry=True)

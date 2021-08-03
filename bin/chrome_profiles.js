#!/usr/bin/env node

let fs = require('fs');
let os = require('os');

const CHROME = os.homedir() + '/AppData/Local/Google/Chrome/User Data'

fs.readdir(CHROME, (err, files) => {
    files.filter(file => file.startsWith('Profile'))
        .forEach(profile => {
            let preferences = fs.readFileSync(`${CHROME}/${profile}/Preferences`, 'utf-8');
            preferences = JSON.parse(preferences);
            console.log(`${profile} = ${preferences.profile.name}`);
        });
});


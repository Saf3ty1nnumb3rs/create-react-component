#!/bin/bash

SRC="src"
COMPONENTS="components"
if [ -e "$SRC" ]; then
    cd "$SRC"
else
    mkdir "$SRC"
    cd "$SRC"
fi

if [ -e "$COMPONENTS" ]; then
    cd "$COMPONENTS"
else
    mkdir "$COMPONENTS"
    cd "$COMPONENTS"
fi

COMPONENTNAME=${1?Error: Enter a name for your component}

mkdir $COMPONENTNAME

cd $COMPONENTNAME

touch $COMPONENTNAME-styles.js

echo "// import styled from 'styled-components'" >$COMPONENTNAME-styles.js

echo "import React from 'react';

const $COMPONENTNAME = () => {
    return (
        <div>

        </div>
    );
};

export default $COMPONENTNAME;" >$COMPONENTNAME.jsx

touch $COMPONENTNAME.test.js

echo  "import React from 'react';
import ReactDOM from 'react-dom';
import $COMPONENTNAME from './$COMPONENTNAME';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<$COMPONENTNAME />, div);
  ReactDOM.unmountComponentAtNode(div);
});" >$COMPONENTNAME.test.js

touch package.json

echo "{
    \"main\":  \"$COMPONENTNAME.jsx\"
}" >package.json

cd "../../../"

echo "$COMPONENTNAME Component created"

# Sass

# touch $COMPONENTNAME.scss

# Comment this out on  line 25-27
# touch $COMPONENTNAME-styles.js

# echo "// import styled from 'styled-components'" >$COMPONENTNAME-styles.js

# This  will continually add with each new component, no good

# echo "
# #create-react-component
# /create-react-component.sh" >> .gitignore

# This will work if user is starting from cra, still no good

# echo "# See https://help.github.com/articles/ignoring-files/ for more about ignoring files.

# # dependencies
# /node_modules
# /.pnp
# .pnp.js

# # testing
# /coverage

# # production
# /build

# # misc
# .DS_Store
# .env.local
# .env.development.local
# .env.test.local
# .env.production.local

# npm-debug.log*
# yarn-debug.log*
# yarn-error.log*

# #create-react-component
# /create-react-component.sh
# " >.gitignore
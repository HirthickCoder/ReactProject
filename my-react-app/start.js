const { spawn } = require('child_process');
const path = require('path');

// Start the Vite dev server
const vite = spawn('npm', ['start'], {
  stdio: 'inherit',
  shell: true,
  cwd: __dirname
});

vite.on('close', (code) => {
  console.log(`Vite process exited with code ${code}`);
});

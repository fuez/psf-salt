haproxy:
  services:
    docs:
      domains:
        - docs.python.org
        - doc.python.org

    downloads:
      domains:
        - www.python.org
      path: /ftp/
      check: "HEAD /_check HTTP/1.1\\r\\nHost:\\ www.python.org"

    codespeed-cpython:
      domains:
        - speed.python.org
      verify_host: codespeed.psf.io
      check: "HEAD / HTTP/1.1\\r\\nHost:\\ speed.python.org"

    codespeed-pypy:
      domains:
        - speed.pypy.org
      verify_host: codespeed.psf.io
      check: "HEAD / HTTP/1.1\\r\\nHost:\\ speed.pypy.org"

    console:
      domains:
        - console.python.org
      check: False
      ca-file: "ca-certificates.crt"
      verify_host: www.pythonanywhere.com
      extra:
        - http-request replace-header Host ^.*$ www.pythonanywhere.com
        - "http-request deny unless { path_beg -i /static/ } or { path_beg -i /python-dot-org-console/ } or { path_beg -i /python-dot-org-live-consoles-status }"

    hg:
      domains:
        - hg.python.org
      check: "GET /test/rev/ea32503c754c HTTP/1.1\\r\\nHost:\\ hg.python.org"

    pypa-bootstrap:
      domains:
        - bootstrap.pypa.io
      verify_host: bootstrap.pypa.psf.io
      check: "HEAD / HTTP/1.1\\r\\nHost:\\ bootstrap.pypa.io"

    pypy-web:
      domains:
        - www.pypy.org
      hsts_subdomains: False
      hsts_preload: False
      verify_host: pypy-web.psf.io
      check: "HEAD / HTTP/1.1\\r\\nHost:\\ pypy-web.psf.io"

    letsencrypt-well-known:
      domains: []
      verify_host: salt.psf.io
      check: "GET /.well-known/acme-challenge/sentinel HTTP/1.1\\r\\nHost:\\ salt.psf.io"

  redirects:
    cheeseshop.python.org:
      target: pypi.python.org
    jobs.python.org:
      target: www.python.org/jobs/
      request_uri: False
    packages.python.org:
      target: pythonhosted.org
    planet.python.org:
      target: planetpython.org
      tls: False
    python.org:
      target: www.python.org
      hsts_subdomains: False
    pypa.io:
      target: www.pypa.io
    www.pycon.org:
      target: pycon.org
      hsts_subdomains: False
      hsts_preload: False
    jython.org:
      target: www.jython.org
      hsts_subdomains: False
      hsts_preload: False
    jython.com:
      target: www.jython.org
      hsts_subdomains: False
      hsts_preload: False
    www.jython.com:
      target: www.jython.org
      hsts_subdomains: False
      hsts_preload: False
    jython.net:
      target: www.jython.org
      hsts_subdomains: False
      hsts_preload: False
    www.jython.net:
      target: www.jython.org
      hsts_subdomains: False
      hsts_preload: False
    pypy.org:
      target: www.pypy.org
      hsts_subdomains: False
      hsts_preload: False
      tls: False

  listens:
    hg_ssh:
      bind: :20100
      service: hg-ssh

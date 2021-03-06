require 'package'

class Elinks < Package
  description 'Full-Featured Text WWW Browser'
  homepage 'http://elinks.or.cz/'
  version 'f86be6597'

  source_url 'https://gitlab.com/alanaktion/elinks-mirror/repository/f86be659718c0cd0a67f88b42f07044c23d0d028/archive.tar.gz'
  source_sha256 'c19a342a5a6716b5213a4c539a149711491136d8b12daba7846bc2225c5fb309'

  binary_url ({
  })
  binary_sha256 ({
  })

  depends_on 'bz2'
  depends_on 'lzip'
  depends_on 'openssl'
  depends_on 'zlibpkg'

  def self.build
    system "sh autogen.sh"
    system "./configure --without-x --prefix=#{CREW_PREFIX} --libdir=#{CREW_LIB_PREFIX}"
    system "make"
  end

  def self.install
    system "make DESTDIR=#{CREW_DEST_DIR} install"
  end
end

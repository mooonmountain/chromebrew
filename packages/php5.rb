require 'package'

class Php5 < Package
  description 'PHP is a popular general-purpose scripting language that is especially suited to web development.'
  homepage 'http://www.php.net/'
  version '5.6.31-1'
  source_url 'http://php.net/distributions/php-5.6.31.tar.xz'
  source_sha256 'c464af61240a9b7729fabe0314cdbdd5a000a4f0c9bd201f89f8628732fe4ae4'

  binary_url ({
  })
  binary_sha256 ({
  })

  depends_on 'pkgconfig'
  depends_on 'zlibpkg'
  depends_on 'libpng'
  depends_on 'libxml2'
  depends_on 'libxslt'
  depends_on 'openssl'
  depends_on 'curl'
  depends_on 'pcre'
  depends_on 'readline'

  def self.build
    system './configure \
      --prefix=/usr/local \
      --with-curl \
      --with-gd \
      --with-xsl \
      --enable-mbstring \
      --with-openssl \
      --with-pcre-regex \
      --with-readline \
      --with-zlib'
    system 'make'
  end

  def self.install
    system "make", "INSTALL_ROOT=#{CREW_DEST_DIR}", "install"

    # clean up some files created under #{CREW_DEST_DIR}. check http://pear.php.net/bugs/bug.php?id=20383 for more details
    system "mv", "#{CREW_DEST_DIR}/.depdb", "#{CREW_DEST_DIR}/usr/local/lib/php"
    system "mv", "#{CREW_DEST_DIR}/.depdblock", "#{CREW_DEST_DIR}/usr/local/lib/php"
    system "rm", "-rf", "#{CREW_DEST_DIR}/.channels", "#{CREW_DEST_DIR}/.filemap", "#{CREW_DEST_DIR}/.lock", "#{CREW_DEST_DIR}/.registry"
  end
end

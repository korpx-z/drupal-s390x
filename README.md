# What is Drupal?

Drupal is a free and open-source content-management framework written in PHP and distributed under the GNU General Public License. It is used as a back-end framework for at least 2.1% of all Web sites worldwide ranging from personal blogs to corporate, political, and government sites including WhiteHouse.gov and data.gov.uk. It is also used for knowledge management and business collaboration.

> [wikipedia.org/wiki/Drupal](https://en.wikipedia.org/wiki/Drupal)

# How to use this image

The basic pattern for starting a `drupal` instance is:

```console
$ docker run --name some-drupal -d drupal
```

If you'd like to be able to access the instance from the host without the container's IP, standard port mappings can be used:

```console
$ docker run --name some-drupal -p 8080:80 -d drupal
```

Then, access it via `http://localhost:8080` or `http://host-ip:8080` in a browser.

There are multiple database types supported by this image [(mySQL, Postgres)](https://github.com/docker-library/drupal/), most easily used via Docker networks. In the default configuration, SQLite can be used to avoid a second container and write to flat-files. 

## Volumes
Per the [official repo...](https://github.com/docker-library/drupal/)
By default, this image does not include any volumes. There is a lot of good discussion on this topic in [docker-library/drupal#3](https://github.com/docker-library/drupal/issues/3), which is definitely recommended reading.

There is consensus that `/var/www/html/modules`, `/var/www/html/profiles`, and `/var/www/html/themes` are things that generally ought to be volumes (and might have an explicit `VOLUME` declaration in a future update to this image), but handling of `/var/www/html/sites` is somewhat more complex, since the contents of that directory *do* need to be initialized with the contents from the image.


```console
$ docker volume create drupal-sites
$ docker run --rm -v drupal-sites:/temporary/sites drupal cp -aRT /var/www/html/sites /temporary/sites
$ docker run --name some-drupal --network some-network -d \
	-v drupal-modules:/var/www/html/modules \
	-v drupal-profiles:/var/www/html/profiles \
	-v drupal-sites:/var/www/html/sites \
	-v drupal-themes:/var/www/html/themes \
	drupal
```

# License

View [license information](https://www.drupal.org/licensing/faq) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

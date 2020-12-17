### This image is built to run on s390x architecture.
-    [build source](https://github.com/korpx-z/drupal-s390x/tree/master)
-    [original source code](https://github.com/docker-library/drupal)

### Versions
9.0 *via alpine* (fpm-buster is available in this repo for building as well, but not delivered via our quay registry.)

# Drupal

Drupal is a free and open-source content-management framework written in PHP and distributed under the GNU General Public License. It is used as a back-end framework for at least 2.1% of all Web sites worldwide ranging from personal blogs to corporate, political, and government sites including WhiteHouse.gov and data.gov.uk. It is also used for knowledge management and business collaboration.

> [wikipedia.org/wiki/Drupal](https://en.wikipedia.org/wiki/Drupal)

# How to use this image

The basic pattern for starting a `drupal` instance is:

```console
$ docker run --name some-drupal -d quay.io/ibm/drupal:9.0
```

If you'd like to be able to access the instance from the host without the container's IP, standard port mappings can be used:

```console
$ docker run --name some-drupal -p 8080:80 -d quay.io/ibm/drupal:9.0
```

Then, access it via `http://localhost:8080` or `http://host-ip:8080` in a browser.

There are multiple database types supported by this image [(mySQL, Postgres)](https://github.com/docker-library/drupal/), most easily used via Docker networks. In the default configuration, SQLite can be used to avoid a second container and write to flat-files. 

## Volumes
Per the [official repo...](https://github.com/docker-library/drupal/)
"By default, this image does not include any volumes. There is a lot of good discussion on this topic in [docker-library/drupal#3](https://github.com/docker-library/drupal/issues/3), which is definitely recommended reading."

"There is consensus that `/var/www/html/modules`, `/var/www/html/profiles`, and `/var/www/html/themes` are things that generally ought to be volumes (and might have an explicit `VOLUME` declaration in a future update to this image), but handling of `/var/www/html/sites` is somewhat more complex, since the contents of that directory *do* need to be initialized with the contents from the image."


```console
$ docker volume create drupal-sites
$ docker run --rm -v drupal-sites:/temporary/sites drupal cp -aRT /var/www/html/sites /temporary/sites
$ docker run --name some-drupal --network some-network -d \
	-v drupal-sites:/var/www/html/sites \
	quay.io/ibm/drupal:9.0
```

# License

View [license information](https://www.drupal.org/licensing/faq) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

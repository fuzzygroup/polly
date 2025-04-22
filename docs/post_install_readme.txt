
[DEVISE] Please review the [changelog] and [upgrade guide] for more info on Hotwire / Turbo integration.

  [changelog] https://github.com/heartcombo/devise/blob/main/CHANGELOG.md
  [upgrade guide] https://github.com/heartcombo/devise/wiki/How-To:-Upgrade-to-Devise-4.9.0-%5BHotwire-Turbo-integration%5D
  Post-install message from rubyzip:
RubyZip 3.0 is coming!
**********************

The public API of some Rubyzip classes has been modernized to use named
parameters for optional arguments. Please check your usage of the
following classes:
  * `Zip::File`
  * `Zip::Entry`
  * `Zip::InputStream`
  * `Zip::OutputStream`
  * `Zip::DOSTime`

Run your test suite with the `RUBYZIP_V3_API_WARN` environment
variable set to see warnings about usage of the old API. This will
help you to identify any changes that you need to make to your code.
See https://github.com/rubyzip/rubyzip/wiki/Updating-to-version-3.x for
more information.

Please ensure that your Gemfiles and .gemspecs are suitably restrictive
to avoid an unexpected breakage when 3.0 is released (e.g. ~> 2.3.0).
See https://github.com/rubyzip/rubyzip for details. The Changelog also
lists other enhancements and bugfixes that have been implemented since
version 2.3.0.
Post-install message from solid_cache:
Upgrading from Solid Cache v0.3 or earlier? There are new database migrations in v0.4.
See https://github.com/rails/solid_cache/blob/main/upgrading_to_version_0.4.x.md for upgrade instructions.
Post-install message from solid_queue:
Upgrading from Solid Queue < 1.0? Check details on breaking changes and upgrade instructions
--> https://github.com/rails/solid_queue/blob/main/UPGRADING.md
1 installed gem you directly depend on is looking for funding.
  Run `bundle fund` for details
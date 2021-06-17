module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="/">Talent</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/Candidates">Candidates</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=new">New</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=interviewed">Interviewed</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=contacted">Contacted</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=tech interview">Tech interview</a>
                    </li>
                </ul>
            </div>
        </nav>
         <div style="background-color: #657b83; padding-top: 2rem; padding-bottom: 2rem; color:hsla(196, 13%, 96%, 1); border-radius: 4px">
              <div style="max-width: 800px; margin-left: auto; margin-right: auto">
                  <h1 style="margin-bottom: 2rem; font-size: 2rem; font-weight: 300; border-bottom: 1px solid white; padding-bottom: 0.25rem; border-color: hsla(196, 13%, 60%, 1)">
                      IHP
                  </h1>

                  <h2 style="margin-top: 0; margin-bottom: 0rem; font-weight: 900; font-size: 3rem">
                      It's working!
                  </h2>

                  <p style="margin-top: 1rem; font-size: 1.75rem; font-weight: 600; color:hsla(196, 13%, 80%, 1)">
                     Your new application is up and running.
                  </p>

                  <a href="https://ihp.digitallyinduced.com/Guide/your-first-project.html" style="margin-top: 2rem; background-color: #268bd2; padding: 1rem; border-radius: 3px; color: hsla(205, 69%, 98%, 1); text-decoration: none; font-weight: bold; display: inline-block; box-shadow: 0 4px 6px hsla(205, 69%, 0%, 0.08);  transition: box-shadow 0.2s; transition: transform 0.2s;" target="_blank">
                     Learn the Next Steps in the Documentation
                  </a>
              </div>
         </div>

         <div style="max-width: 800px; margin-left: auto; margin-right: auto; margin-top: 4rem">
              <img src="/ihp-welcome-icon.svg" alt="/ihp-welcome-icon">
              <p style="color: hsla(196, 13%, 50%, 1); margin-top: 4rem">
                 You can modify this start page by making changes to "./Web/View/Static/Welcome.hs".
              </p>
         </div> 
|]
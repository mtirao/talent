module Web.View.Candidates.Show where
import Web.View.Prelude

data ShowView = ShowView { candidate :: Candidate }

instance View ShowView where
    html ShowView { .. } = [hsx|
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
                        <a class="nav-link" href="/FilterCandidates?candidatesState=contacted">Contacted</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=interviewed">Interviewed</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=tech interview">Tech interview</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=offered">Job Offer</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/FilterCandidates?candidatesState=hired">Hired</a>
                    </li>
                </ul>
            </div>
        </nav>

        <h1>Show Candidate</h1>
         <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Name</h6>
                <small class="text-muted">{(get #name candidate)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Education</h6>
                <small class="text-muted">{(get #education candidate)}</small>
              </div>
            </li>
             <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Email</h6>
                <small class="text-muted">{(get #email candidate)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Tech skill</h6>
                <small class="text-muted">{(get #skills candidate)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Status</h6>
                <small class="text-muted">{(get #status candidate)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Linkedin</h6>
                <small class="text-muted">{(get #linkedin candidate)}</small>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Github</h6>
                <small class="text-muted">{(get #github candidate)}</small>
              </div>
            </li>
        </ul>
    |]

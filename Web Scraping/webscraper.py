import wikipedia
import os
import re
from Tkinter import *
import Tkinter as tk
import tkMessageBox
import GoogleScraper
import urllib.parse

class App():
    def __init__(self, master):
        frame = Frame(master)
        frame.pack()

        master.title("Querier")
        self.label = Label(frame, text="Make your query:")

        self.queryEntry = Entry(frame)

        self.queryButton = Button(frame, text="Query It", width=20, command=self.queryAction)

        self.label.grid(row=0, column=0)
        self.queryEntry.grid(row=0, column=1)
        self.queryButton.grid(row=1, column=0)

    def queryAction(self):
        queryVar = self.queryEntry.get()
        splitted = queryVar.split()
        if splitted[0] == "command":
            command = re.sub('command ', '', queryVar)
            os.system(command)
        elif splitted[0] == "summary":
            searchVar = re.sub('search ', '', queryVar)
            summaryVar = wikipedia.summary(searchVar, sentences=3)
            tkMessageBox.showinfo("Query Results", summaryVar)
        elif splitted[0] == "search":
            searchVar = re.sub('summary ', '', queryVar)
            searchResults = ""
            if __name__ == '__main__':

                results = GoogleScraper.scrape(searchVar, num_results_per_page=50, num_pages=3, offset=0)
                for page in results:
                    for link_title, link_snippet, link_url in page['results']:
                        # You can access all parts of the search results like that
                        # link_url.scheme => URL scheme specifier (Ex: 'http')
                        # link_url.netloc => Network location part (Ex: 'www.python.org')
                        # link_url.path => URL scheme specifier (Ex: ''help/Python.html'')
                        # link_url.params => Parameters for last path element
                        # link_url.query => Query component
                        try:
                            # print(urllib.parse.unquote(link_url.geturl())) # This reassembles the parts of the url to the whole thing
                            searchResults += urllib.parse.unquote(link_url.geturl())
                        except:
                            pass

            # How many urls did we get on all pages?
            #print(sum(len(page['results']) for page in results))

            # How many hits has google found with our keyword (as shown on the first page)?
            #print(results[0]['num_results_for_kw'])
            tkMessageBox.showinfo("Query Results", searchResults)

root = Tk()
app = App(root)
root.mainloop()
